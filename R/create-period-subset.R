#########################################################################################
# File:   create-period-subcorpora.R                                                    # 
# Date:   2015-05-13                                                                    #
# Author: Joseph Flanagan                                                               #
# email:  joseph.flanagan@helsinki.fi                                                   #
# Purpose: create the Scottish subcorpora for shiny app                                 #                           
#########################################################################################

#  Be sure to run pos-tagging.R and export-semiclean-ceec.R before running this script

# This really should be converted to a function rather than repeating all these actions

# eventually create new script instead of using pos-tagging.R

library("magrittr")
library("NLP")
library("dplyr")
library("tidyr")
library("stringr")


# Read in corpus
tagged_corpus <- readRDS("output/tagged_corpus.rds")


# remove .txt
tagged_corpus <- tagged_corpus %>%
    separate(text_id, c("LetterID", "junk"), -5) %>%
    select(-junk)

# read in letter database
database_letter <- read.delim("data/ceec-metadata/database_letter.txt")

# select relevant columns
letter <- database_letter %>%
    select(LetterID, Year)

# merge
corpus <- tagged_corpus %>%
    left_join(letter)


# Select letters containing Scotand, Scottish, Scots, or Scot
scotland <- corpus %>% 
    filter(str_detect(word, "^scot"))  %>% 
    filter(word != "scott", word != "scotchcollops")

# Remove duplicates so that we get each letter once 
scotland2  <- scotland %>%
    group_by(LetterID) %>%
    filter(row_number(LetterID) == 1)


# BEFORE 1700

period1 <- scotland2 %>%
    filter(Year < 1700) %>%
    select(LetterID)

# Append .tex at the end
filenames <- lapply(period1$LetterID,function(x) paste0(x,'.txt'))

# Preface with directory path
filenames <- lapply(filenames, function(x) paste0("output/semicleaned-data/", x))


# Read in files
texts <- filenames %>%
    lapply(readLines) %>%
    lapply(paste0, collapse = " ") %>%
    lapply(as.String) 


# Convert to base R string
text <- toString(texts)


# Print to shiny directory (change to relevant directory)
writeLines(text, "shiny/period1.txt")


# 1700:1719

period2 <- scotland2 %>%
    filter(Year %in% c(1700:1719)) %>%
    select(LetterID)

# Append .tex at the end
filenames <- lapply(period2$LetterID,function(x) paste0(x,'.txt'))

# Preface with directory path
filenames <- lapply(filenames, function(x) paste0("output/semicleaned-data/", x))


# Read in files
texts <- filenames %>%
    lapply(readLines) %>%
    lapply(paste0, collapse = " ") %>%
    lapply(as.String) 


# Convert to base R string
text <- toString(texts)


# Print to shiny directory (change to relevant directory)
writeLines(text, "shiny/period2.txt")

## AfTER 1719

period3 <- scotland2 %>%
    filter(Year > 1719) %>%
    select(LetterID)

# Append .tex at the end
filenames <- lapply(period3$LetterID,function(x) paste0(x,'.txt'))

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
writeLines(text, "shiny/period3.txt")
