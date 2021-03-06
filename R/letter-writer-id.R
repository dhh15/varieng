#########################################################################################
# File: letter-writer-id.R 
# Date:     2015-05-13  
# Author:  Joseph Flanagan
# email:    joseph.flanagan@helsinki.fi
# Purpose: Find letters written by specific writers and create subcorpus of their letters
#########################################################################################

library("dplyr")
library("tidyr")

# Read in letter database
database_letter <- read.delim("data/metadata/database_letter.txt")


# Select letters written by george 3
george3 <- database_letter %>%
    filter(Sender == "GEORGE3") %>%
    select(LetterID) 

# Append .tex at the end
filenames <- lapply(george3$LetterID,function(x) paste0(x,'.txt'))

# Preface with directory path
filenames2 <- lapply(filenames, function(x) paste0("output/semicleaned-data/", x))

# Read in files
texts <- filenames2 %>%
    lapply(readLines) %>%
    lapply(paste0, collapse = " ") %>%
    lapply(as.String) 


# Convert to base R script
text <- toString(texts)

# Print to shiny directory
writeLines(text, "shiny/george3.txt")

ecarter <- database_letter %>%
    filter(Sender == "ECARTER")

