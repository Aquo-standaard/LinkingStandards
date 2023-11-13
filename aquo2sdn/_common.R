# example R options set globally
options(width = 60)

source("R/functies.R")

library(kableExtra) 
require(tidyverse)
require(data.table)
require(stringr)
# Lees functie in voor download domeintabellen
require(aquodom)
require(rwsapi)
require(rlist)
require(sf)
require(leaflet)

# example chunk options set globally
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = F,
  message = F,
  echo = F
  )

options(knitr.table.format = "latex")
