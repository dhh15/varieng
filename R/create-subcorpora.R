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
library("dplyr")



# Read in letter database
database_letter <- read.delim("data/metadata/database_letter.txt")


## ADDISON

# Select letters written by addison
addison <- database_letter %>%
    filter(Sender == "JADDISON") %>%
    select(LetterID) 

# Append .tex at the end
filenames <- lapply(addison$LetterID,function(x) paste0(x,'.txt'))

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
writeLines(text, "shiny/addison.txt")


## AUSTEN

# Select letters written by ecarter
austen <- database_letter %>%
    filter(Sender == "JAUSTEN") %>%
    select(LetterID) 

# Append .tex at the end
filenames <- lapply(austen$LetterID,function(x) paste0(x,'.txt'))

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
writeLines(text, "shiny/austen.txt")


## DEFOE
# Select letters written by defoe
defoe <- database_letter %>%
    filter(Sender == "DDEFOE") %>%
    select(LetterID) 

# Append .tex at the end
filenames <- lapply(defoe$LetterID,function(x) paste0(x,'.txt'))

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


## GEORGE III
# Select letters written by ecarter
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
writeLines(text, "shiny/george3.txt")


## ECARTER
# Select letters written by ecarter
ecarter <- database_letter %>%
    filter(Sender == "ECARTER") %>%
    select(LetterID) 

# Append .tex at the end
filenames <- lapply(ecarter$LetterID,function(x) paste0(x,'.txt'))

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
writeLines(text, "shiny/ecarter.txt")

