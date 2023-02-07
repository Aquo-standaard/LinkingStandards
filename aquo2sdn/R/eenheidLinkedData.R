
library(rdflib)
library(tidyverse)
library(jsonld)

FileName_RDF = "http://vocab.nerc.ac.uk/collection/P06/current/?_profile=nvs&_mediatype=text/turtle"
FileName_Aquo = "https://www.aquo.nl/index.php?title=Speciaal%3AVragen&q=%5B%5BCategorie%3ADomeinwaarden%5D%5D+%5B%5BBreder%3A%3AId-04f4f467-021b-4218-baa8-9742ed977c61%5D%5D%5B%5BBegin+geldigheid%3A%3A%3E1+januari+2000%5D%5D%5B%5BEind+geldigheid%3A%3A%3E07-02-2023%5D%5D%0D%0A&po=%3FVoorkeurslabel%0D%0A%3FCodes%0D%0A%3FOmschrijving%0D%0A%3FDimensie%0D%0A%3FOmrekenfactor%0D%0A%3FGroep%0D%0A%3FId%0D%0A%3FBegin+geldigheid%0D%0A%3FEind+geldigheid%0D%0A%3FGerelateerd%0D%0A&eq=yes&p%5Bformat%5D=rdf&sort_num=&order_num=ASC&p%5Bsource%5D=&p%5Blimit%5D=13000&p%5Boffset%5D=&p%5Blink%5D=none&p%5Bsort%5D=&p%5Bheaders%5D=show&p%5Bmainlabel%5D=&p%5Bintro%5D=&p%5Boutro%5D=&p%5Bsearchlabel%5D=%E2%80%A6+overige+resultaten&p%5Bdefault%5D=&p%5Bclass%5D=sortable+wikitable+smwtable&p%5Btheme%5D=bootstrap&eq=yes&format=rdf"

destination_csv = "aquo2sdn/data/mappings/otherMappings/eenheid-aquo-bodc.csv"

rdf_p06 <- rdf_parse(FileName_RDF, format = "turtle") 
unit <- read_csv2("https://www.aquo.nl/index.php?title=Speciaal%3AVragen&q=%5B%5BCategorie%3ADomeinwaarden%5D%5D+%5B%5BBreder%3A%3AId-04f4f467-021b-4218-baa8-9742ed977c61%5D%5D%5B%5BBegin+geldigheid%3A%3A%3E1+januari+2000%5D%5D%5B%5BEind+geldigheid%3A%3A%3E07-02-2023%5D%5D%0D%0A&po=%3FCodes%0D%0A%3FOmschrijving%0D%0A%3FDimensie%0D%0A%3FOmrekenfactor%0D%0A%3FGroep%0D%0A%3FId%0D%0A%3FBegin+geldigheid%23ISO%0D%0A%3FEind+geldigheid%23ISO%0D%0A%3FGerelateerd%5D%5D%0D%0A&eq=yes&p%5Bformat%5D=csv&p%5Bsep%5D=%3B&sort_num=&order_num=ASC&p%5Bsource%5D=&p%5Blimit%5D=13000&p%5Boffset%5D=&p%5Blink%5D=all&p%5Bsort%5D=&p%5Bheaders%5D=show&p%5Bmainlabel%5D=&p%5Bintro%5D=&p%5Boutro%5D=&p%5Bsearchlabel%5D=%E2%80%A6+overige+resultaten&p%5Bdefault%5D=&p%5Bclass%5D=sortable+wikitable+smwtable&p%5Btheme%5D=bootstrap&eq=yes&format=csv")
rdf_aquo_par <- rdf_parse(FileName_Aquo)

query <- "PREFIX owl:  <http://www.w3.org/2002/07/owl#> prefix skos: <http://www.w3.org/2004/02/skos/core#>
SELECT *
WHERE {
    ?id owl:sameAs ?intUnit;
          skos:altLabel ?alt .
} ORDER BY ?id"


RDFTable_unit <- rdf_query(rdf_p06, query) %>%
  mutate(intUnit2 = str_remove(intUnit, pattern = "[^/]+(?=/$|$)")) %>%
  mutate(intUnit2 = case_when(
    intUnit2 == "http://qudt.org/vocab/unit/" ~ "qudt",
    intUnit2 == "http://dbpedia.org/resource/" ~ "dbpedia",
    intUnit2 == "http://vocab.nerc.ac.uk/collection/P06/current//" ~ "bodc_alt",
    intUnit2 == "http://onto.nerc.ac.uk/CAST/" ~ "nerc",
  )) %>%
  pivot_wider(names_from = intUnit2, values_from = intUnit) %>%
  write_delim(destination_csv, delim = ";")

