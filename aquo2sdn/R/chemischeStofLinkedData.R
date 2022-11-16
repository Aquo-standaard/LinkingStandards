## Thesaurus
library(rdflib)
library(tidyverse)
library(jsonld)

FileName_RDF = "aquo2sdn/data/bodc/S27.ttl"
FileName_Aquo = "aquo2sdn/data/aquo/Parameter.csv"

destination_csv = "aquo2sdn/data/mappings/chemischeStof/CAS-aquo-bodc.csv"

parameter <- read.csv(FileName_Aquo,header=TRUE,sep = ";") %>%
  filter(Groep == "ChemischeStof")

rdf <- rdf_parse(FileName_RDF, format = "turtle") 

## Creating tables
query <- "PREFIX owl:  <http://www.w3.org/2002/07/owl#> 
SELECT ?id ?casnr 
WHERE {
    ?id owl:sameAs ?casnr .
} ORDER BY ?id"

RDFTable <- rdf_query(rdf,query)

j<-1
Resultaat <- NULL
for (i in 1:nrow(RDFTable)) {
  if (instr(RDFTable$casnr[i],"https://chem.nlm.nih.gov/chemidplus/rn/")) {
    Resultaat$id[j] <- RDFTable$id[i]
    Resultaat$CASnummer[j] <- gsub("https://chem.nlm.nih.gov/chemidplus/rn/","",RDFTable$pref[i])
    j <- j+1
  }
}

#write.csv(Resultaat,destination_csv, row.names = FALSE)
Resultaat2 <- merge(parameter, Resultaat, by = "CASnummer")       
write.csv(Resultaat2,destination_csv, row.names = FALSE)

# Alternatief

RDFTable2 <- rdf_query(rdf,query) %>%
  filter(grepl("https://chem.nlm.nih.gov/chemidplus/rn/", casnr)) %>%
  mutate(CASnummer = stringr::str_replace(casnr, "https://chem.nlm.nih.gov/chemidplus/rn/","")) %>%
  full_join(
    parameter %>% select(CASnummer, Codes, Omschrijving, Status),
    by = c(casnr = "CASnummer")
  ) %>%
  rename(
    S27_id = id,
    nih_casnrURI = casnr,
    aquo_parameter.code = Codes,
    aquo_parameter.omschrijving = Omschrijving
  ) %>%
  write_delim(destination, delim = ";")




