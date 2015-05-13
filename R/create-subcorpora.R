#########################################################################################
# File:   create-subcorpora.R                                                           # 
# Date:   2015-05-13                                                                    #
# Author: Joseph Flanagan                                                               #
# email:  joseph.flanagan@helsinki.fi                                                   #
# Purpose: create the subcorpora for shiny app                                          #                           
#########################################################################################

# This really should be converted to function and more variables rather than listing everything

library("magrittr")
library("NLP")

# Read in letter database
database_letter <- read.delim("data/metadata/database_letter.txt")


# Select letters written by george 3
george3 <- database_letter %>%
    filter(Sender == "GEORGE3") %>%
    select(LetterID) 

# Append .tex at the end
filenames <- lapply(george3$LetterID,function(x) paste0(x,'.txt'))

# Preface with directory path
filenames <- lapply(filenames, function(x) paste0("output/semicleaned-data/", x))


# Read in files
texts <- filenames %>%
    lapply(readLines) %>%
    lapply(paste0, collapse = " ") %>%
    lapply(as.String) 


# Convert to base R string
text <- toString(texts)


# Print to shiny directory
writeLines(text, "shiny/defoe.txt")

