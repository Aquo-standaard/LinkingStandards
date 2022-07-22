# example R options set globally
options(width = 60)

library(kableExtra) 

# example chunk options set globally
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = F,
  message = F,
  echo = F
  )

options(knitr.table.format = "latex")