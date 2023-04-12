## Thesaurus
library(rdflib)
library(tidyverse)
library(jsonld)

# FileName_RDF = "aquo2sdn/data/bodc/S27.ttl"
FileName_RDF = "http://vocab.nerc.ac.uk/collection/S27/current/?_profile=nvs&_mediatype=text/turtle"
# FileName_Aquo = "aquo2sdn/data/aquo/Parameter.csv"
FileName_Aquo = "https://www.aquo.nl/index.php/Speciaal:RDFExporteren/Id-21795134-d304-412b-a425-ea0979440cf6"

destination_csv = "aquo2sdn/data/mappings/chemischeStof/CAS-aquo-bodc.csv"

rdf <- rdf_parse(FileName_RDF, format = "turtle") 
parameter <- read_csv2("https://www.aquo.nl/file_auth.php/aquo/a/a3/Parameter.csv")

## Creating tables
query <- "PREFIX owl:  <http://www.w3.org/2002/07/owl#> prefix skos: <http://www.w3.org/2004/02/skos/core#>
SELECT *
WHERE {
    ?id owl:sameAs ?casnr;
      skos:altLabel ?alt .
} ORDER BY ?id"

RDFTable2 <- rdf_query(rdf,query) %>%
  filter(
    grepl("https://chem.nlm.nih.gov/chemidplus/rn/", casnr)
  ) %>%
  mutate(CASnummer = stringr::str_replace(casnr, "https://chem.nlm.nih.gov/chemidplus/rn/","")) %>%
  full_join(
    parameter %>% select(CASnummer, Codes, Omschrijving, Status),
    by = c(CASnummer = "CASnummer")
  ) %>%
  filter(
    Status == 'Geldig'
  ) %>%
  rename(
    bodc_S27_id = id,
    bodc_S27_altlable = alt,
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

