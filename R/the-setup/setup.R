# Assemble all of your library statements together rather than sprinkling throughout the code.
#
# I like to wrap the block of library statements with a muffler - some packages are just so noisy!
suppressPackageStartupMessages({
  library(dplyr)    # data manipulation
  library(readr)    # input and output of CSV
  library(ggplot2)  # plotting
  library(jsonlite) # for fetching online data
})

# Set up the paths - CAPITALIZE to remind yourself that you can treat these like 
# constants (as opposed to variables.)
DATAPATH <- "data"
CODEPATH <- "R"
IMAGEPATH <- "image"

# List the R code files, and then source them one at a time.
# Place resuable functions in the source files
files_to_source <- list.files(CODEPATH, pattern = glob2rx("*.R"), full.names = TRUE)
for (sourcefile in files_to_source) source(sourcefile)