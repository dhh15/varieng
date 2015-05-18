#########################################################################################
# File:  export-clean-ceec.R
# Date:  2015-05-12  
# Author: Joseph Flanagan
# email:   joseph.flanagan@helsinki.fi
# Purpose: Export text files from the CEEC corpus that have been cleaned of metadata and punctuation

#########################################################################################

library("NLP")
library("magrittr")

# Get files from subdirectory (warning: imports all files in the subdirectory)

filenames <- Sys.glob("data/ceec-normalised/*.txt")


# Read in files
texts <- filenames %>%
    lapply(readLines) %>%
    lapply(paste0, collapse = " ") %>%
    lapply(as.String) 


# Remove metadata, numbers, and punctuation
texts <- lapply(texts, function(x){
    x = gsub("\\[\\{(.*?)\\{\\]", "\\1", x)         
    x = gsub("\\[\\\\[A-Z]{2,}(.*?)\\\\\\]", "", x) 
    x = gsub("\\[\\\\(.*?)\\\\\\]", "\\1", x)
    x = gsub("<.*?>","", x)
    x = gsub("\\[.*?\\]", "", x)
    x=  gsub("\\(\\^(.*?)\\^\\)", "\\1", x)
    x = gsub("\\d","", x) # get rid of numbers
    x = gsub("[^[:alnum:][:space:]']", "", x) # get rid of punctuation except for apostrophes
    x
})


# Name files according to file name
names(texts) <- basename(filenames)


# Export to clean-data subdirectory
for (i in 1:length(texts)) {
    cat(toString(texts[i]), file=paste0("output/cleaned-data/", names(texts)[i]))
}
