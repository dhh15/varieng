#########################################################################################
# File:    02-merge-tables.R  
# Date:    2015-05-12  
# Author:  Joseph Flanagan
# email:   joseph.flanagan@helsinki.fi
# Purpose: Merge letter metadata

#########################################################################################

library("dplyr")
library("tidyr")


tagged_corpus <- readRDS("output/tagged_corpus.rds")

tagged_corpus <- tagged_corpus %>%
    separate(text_id, c("LetterID", "junk"), -5) %>%
    select(-junk)

database_letter <- read.delim("data/ceec-metadata/database_letter.txt")

letter <- database_letter %>%
    select(LetterID, SenderFirstName, SenderLastName, SenderRank, RecipientFirstName, RecipientLastName, RecRank, RelCode, Year)

corpus <- tagged_corpus %>%
    left_join(letter)
