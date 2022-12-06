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

RDFTable2 <- rdf_query(rdf,query) %>%
  filter(grepl("https://chem.nlm.nih.gov/chemidplus/rn/", casnr)) %>%
  mutate(CASnummer = stringr::str_replace(casnr, "https://chem.nlm.nih.gov/chemidplus/rn/","")) %>%
  full_join(
    parameter %>% select(CASnummer, Codes, Omschrijving, Status),
    by = c(CASnummer = "CASnummer")
  ) %>%
  rename(
    bodc_S27_id = id,
    nih_casnrURI = casnr,
    aquo_parameter.code = Codes,
    aquo_parameter.omschrijving = Omschrijving
  ) %>%
  write_delim(destination_csv, delim = ";")

## testen en proberen van het vormen van tabellen
#data <- read_delim(file = "C:/projecten/rws/2022/IHM_standaarden/LinkingStandards/aquo2sdn/data/mappings/chemischeStof/CAS-aquo-bodc.csv", delim=";")
nan_aquo_parameter.code <- 
  RDFTable2 %>% 
  filter(is.na(aquo_parameter.code))

RDFTable2[duplicated(RDFTable2$bodc_S27_id),]
dim(RDFTable2[duplicated(RDFTable2$bodc_S27_id),])
RDFTable2$bodc_S27_id[duplicated(RDFTable2$bodc_S27_id)]

bodc_antijoin <- rdf_query(rdf,query) %>%
  filter(grepl("https://chem.nlm.nih.gov/chemidplus/rn/", casnr)) %>%
  mutate(CASnummer = stringr::str_replace(casnr, "https://chem.nlm.nih.gov/chemidplus/rn/","")) %>%
  anti_join(
    parameter %>% select(CASnummer),
    by = c(CASnummer = "CASnummer")
  ) %>%
  rename(
    bodc_S27_id = id,
    nih_casnrURI = casnr,
    #aquo_parameter.code = Codes,
    #aquo_parameter.omschrijving = Omschrijving
  )

bodc_antijoin$bodc_S27_id[duplicated(bodc_antijoin$bodc_S27_id)]
duplicated_bodcanti <- dim(bodc_antijoin[duplicated(bodc_antijoin$bodc_S27_id),])






