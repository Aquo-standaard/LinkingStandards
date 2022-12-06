

GetDomainTable <- function(pDomeintabel,pCheckDate=toString(Sys.Date())) {
  message(paste("pCheckDate",pCheckDate))
  library(jsonlite)
  library(httr)
  library(RCurl)
  
  maakTekstURL <- function(tekstURL,categorie,beperking,kenmerken,opmaak){
    returnstring <- paste(tekstURL,categorie,beperking,kenmerken,opmaak,sep="")
    return (returnstring)
  }
  
  bewerkDatum  <- function(pDatum){
    lDatum <- substring(toString(pDatum),3,nchar(pDatum))
    lDatum <- str_replace(lDatum,"/0/0/0/0","")
    lDatum <- toString(lubridate::parse_date_time(lDatum,orders="ymd"))
    return(lDatum)
  }
  
  domeinTabel <- NULL
  tekstUrl <- "https://www.aquo.nl/index.php"
  lStartPage <- 0
  lLimit <- 1
  curl <- getCurlHandle()
  opmaakJson <- paste("%2F&format=json&link=none&headers=show&searchlabel=JSON&class=sortable+wikitable+smwtable"
                      ,"&theme=bootstrap&offset=0&limit=1"
                      ,"&mainlabel=&prettyprint=true&unescape=true"
                      ,sep="")
  
  categorie <- "?title=Speciaal:Vragen&x=-5B-5BElementtype%3A%3ADomeintabel%20%7C%7C%20Domeintabeltechnisch%20%7C%7C%20Domeintabelverzamellijst-5D-5D-20"
  kenmerken <- "%2F-3FElementtype%2F-3FVoorkeurslabel%2F-3FMetadata"
  beperking <- paste("-5B-5BVoorkeurslabel%3A%3A",pDomeintabel,sep = "")
  json_file <- maakTekstURL(tekstUrl,categorie,beperking,kenmerken,opmaakJson)
  #message(json_file)
  req <- httr::GET(json_file, curl=curl)
  
  if (req$status_code == 200 && length(req$content) > 0) {
    domeinTabel <- jsonlite::fromJSON(httr::content(req, "text", encoding="UTF-8"))$results
    
    domeinwaardeCategorie <- NULL
    domeinwaardeCategorie["Domeintabel"]              <- "Domeinwaarden"
    domeinwaardeCategorie["Domeintabeltechnisch"]     <- "DomeinwaardenTechnisch"
    domeinwaardeCategorie["Domeintabelverzamellijst"] <- "Domeinwaarden"
    
    lAantalDomTabellen <- length(domeinTabel)
    if (lAantalDomTabellen == 1) {
      domeinGuid <- domeinTabel[[1]]$fulltext
      domeinElementtype <- domeinTabel[[1]]$printouts$Elementtype$fulltext
      
      # Bepalen Metadata van de domeintabel
      lMetadata <- NULL
      for (i in 1:length(domeinTabel[[1]]$printouts$Metadata) ) {
        lMetadata[i] <- domeinTabel[[1]]$printouts$Metadata[i]
        #message(paste("Metadata:",lMetadata[i]))
      }
      if (!("Status" %in% lMetadata)) lMetadata[length(lMetadata)+1] <- "Status"
      if (!("Wijzigingsnummer" %in% lMetadata)) lMetadata[length(lMetadata)+1] <- "Wijzigingsnummer"
      
      lTypeTabel <- paste("-5B-5BElementtype%3A%3A",domeinElementtype,"-5D-5D-20",sep = "")
      beperking <- paste("-5B-5BBreder%3A%3A",gsub("-","-2D",domeinGuid),"-5D-5D"
                         ,"-5B-5BBegin-20geldigheid::<=",pCheckDate,"-5D-5D-5B-5BEind-20geldigheid::>=",pCheckDate,"-5D-5D"
                         ,sep = "")
      categorie <- paste("?title=Speciaal:Vragen&x=-5B-5BCategorie%3A",
                         domeinwaardeCategorie[domeinElementtype],"-5D-5D-20",sep = "")
      
      kenmerken <- NULL
      for (i in 1:length(lMetadata)) kenmerken <- paste(kenmerken,"%2F-3F",lMetadata[i],sep="")
      columnNames <- list()
      for (i in 1:length(lMetadata)) columnNames[[i]] <- lMetadata[i]
      columnNames[[length(columnNames)+1]] <- "Guid"
      domValuesDFloc <- data.frame(matrix(ncol = length(lMetadata)+1, nrow = 0))
      colnames(domValuesDFloc) <- columnNames
      
      lOffset <- 0
      lLimit <- 500
      lDoorgaan <- TRUE
      while (lDoorgaan) {
        opmaakJson <- paste("/format%3Djson/link%3Dall/headers%3Dshow/searchlabel=JSON/class=sortable-20wikitable-20smwtable"
                            ,"/sort%3DId/order%3Dasc"
                            ,"/theme=bootstrap/offset=",lOffset,"/limit=",lLimit
                            ,"/mainlabel=/prettyprint=true/unescape=true"
                            ,sep="")
        json_file <- maakTekstURL(tekstUrl,categorie,beperking,kenmerken,opmaakJson)
        #message(paste("Domeinwaarden:",json_file))
        req <- httr::GET(json_file, curl=curl)
        if (req$status_code == 200 && length(req$content) > 0) {
          gevonden <- TRUE
          tryCatch(
            {
              domValuesJson <- jsonlite::fromJSON(httr::content(req, "text", encoding="UTF-8"))$results
              #message(length(domValuesJson))
              message(paste(toString(Sys.time()),"Aantal waarden opgehaald:",length(domValuesJson)+lOffset, sep = " "))
            },
            warning = function(w){
              gevonden <<- FALSE
            },
            error = function(e){
              gevonden <<- FALSE
            },
            finally={
            }
          )
          if (gevonden) {
            for (i in 1:length(domValuesJson)) {
              j <- i + lOffset
              domValuesDFloc[j,"Guid"] <- domValuesJson[[i]]$fulltext
              lColumns <- colnames(domValuesDFloc)
              lColumns <- lColumns[!lColumns %in% c("Guid")]
              for (x in lColumns) {
                if (length(unlist(domValuesJson[[i]]$printouts[x]) > 0 && is.na(unlist(domValuesJson[[i]]$printouts[x])))) {
                  if (x == "Begin geldigheid" || x == "Eind geldigheid") {
                    domValuesDFloc[j,x] <- unlist(domValuesJson[[i]]$printouts[x][[1]]$raw) #bewerkDatum(unlist(domValuesJson[[i]]$printouts[x][[1]]$raw))
                    domValuesDFloc[j,x] <- bewerkDatum(unlist(domValuesJson[[i]]$printouts[x][[1]]$raw))
                  }
                  else {
                    if (x == "Gerelateerd") {
                      if (length(unlist(domValuesJson[[i]]$printouts["Gerelateerd"][[1]]$fulltext)) > 0) {
                        gerelateerd <- NULL
                        for (k in 1:length(unlist(domValuesJson[[i]]$printouts["Gerelateerd"][[1]]$fulltext))) {
                          #message("er is lengte")
                          if (k == 1) {
                            gerelateerd <- unlist(domValuesJson[[i]]$printouts["Gerelateerd"][[1]]$fulltext[1])
                          }
                          else {
                            #message("lengte > 1")
                            gerelateerd <- paste(gerelateerd,unlist(domValuesJson[[i]]$printouts["Gerelateerd"][[1]]$fulltext[k]),sep=",")
                          }
                        }
                        #message(gerelateerd)
                        domValuesDFloc[j,x] <- gerelateerd
                      }
                    }
                    else {
                      domValuesDFloc[j,x] <- toString(unlist(domValuesJson[[i]]$printouts[x]))
                    }
                  }
                }
              }
            }
            if (length(domValuesJson) == lLimit) {
              lOffset <- lOffset + lLimit
            }
            else lDoorgaan <- FALSE
          }
        }
        else {
          lDoorgaan <- FALSE
          message("Domeinwaarden bestaat niet")
        }
      }
      domValuesDFloc$Id <- as.numeric(domValuesDFloc$Id)
      domValuesDFloc <- domValuesDFloc[order(domValuesDFloc$Id),] 
      #domValuesDFloc <- domValuesDFloc2
    }
  }
  else {
    domValuesDFloc <- data.frame(matrix(ncol = 2, nrow = 0))
    colnames(domValuesDFloc) <- as.list(c("Domeintabel","Melding"))
    domValuesDFloc[1,"Domeintabel"] <- pDomeintabel
    domValuesDFloc[1,"Melding"] <- "Domeintabel bestaat niet"
  }
  return(domValuesDFloc)
}