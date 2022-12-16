# example R options set globally
options(width = 60)

library(kableExtra) 
require(tidyverse)
require(data.table)
require(stringr)
# Lees functie in voor download domeintabellen
source("R/functies.R")
require(aquodom)
require(rwsapi)
require(rlist)

# example chunk options set globally
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = F,
  message = F,
  echo = F
  )

options(knitr.table.format = "latex")