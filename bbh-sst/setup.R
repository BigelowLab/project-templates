suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
  library(ggplot2)
  library(here)
})

DATAPATH <- here::here("data")
CODEPATH <- here::here("R")

files_to_source <- list.files(CODEPATH, pattern = glob2rx("*.R"), full.names = TRUE)
for (sourcefile in files_to_source) source(sourcefile)