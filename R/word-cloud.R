#########################################################################################
# File:  word-cloud.R
# Date:  2015-05-13  
# Author:  Joseph Flanagan
# email:    joseph.flanagan@helsinki.fi
# Purpose: Create a wordcloud

#########################################################################################

library("tm")
library("magrittr")
library("wordcloud")

# Get file names from a subdirectory

filenames <- Sys.glob("data/austen/*.txt")

# Read in files

texts <- filenames %>%
    lapply(readLines) %>%
    lapply(paste0, collapse = " ") %>%
    lapply(as.String) 

# Convert to base R string

text <- toString(texts)


# Process

my_corpus  <-  Corpus(VectorSource(text))
my_corpus <- tm_map(my_corpus, content_transformer(tolower))
my_corpus <- tm_map(my_corpus, removeWords, stopwords("english"))


my_DTM  <-  TermDocumentMatrix(my_corpus, control = list(minWordLength = 1))

m = as.matrix(my_DTM)

v = sort(rowSums(m), decreasing = TRUE)

# Create wordcloud

set.seed(1234)
wordcloud(names(v), v, min.freq = 15)