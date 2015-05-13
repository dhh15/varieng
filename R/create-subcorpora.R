#########################################################################################
# File:   create-subcorpora.R                                                           # 
# Date:   2015-05-13                                                                    #
# Author: Joseph Flanagan                                                               #
# email:  joseph.flanagan@helsinki.fi                                                   #
# Purpose: create the subcorpora for shiny app                                          #                           
#########################################################################################

# This really should be converted to function and more variables rather than listing everything

# Get file names from a subdirectory
filenames <- Sys.glob("data/austen/*.txt")


# Read in files
texts <- filenames %>%
    lapply(readLines) %>%
    lapply(paste0, collapse = " ") %>%
    lapply(as.String) 


# Convert to base R string
text <- toString(texts)


# Print to shiny directory
writeLines(text, "shiny/austen.txt")

