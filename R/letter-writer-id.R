#########################################################################################
# File: letter-writer-id.R 
# Date:     2015-05-13  
# Author:  Joseph Flanagan
# email:    joseph.flanagan@helsinki.fi
# Purpose: Find letters written by specific writers
#########################################################################################

library("dplyr")
library("tidyr")


database_letter <- read.delim("data/metadata/database_letter.txt")

george3 <- database_letter %>%
    filter(Sender == "GEORGE3")

ecarter <- database_letter %>%
    filter(Sender == "ECARTER")