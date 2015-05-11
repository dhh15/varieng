#########################################################################################
# File:  pos-tagging.R                                                                  #
# Date:  2015-05-06                                                                     #
# Author: Joseph Flanagan                                                               #
# email:  joseph.flanagan@helsinki.fi                                                   #
# Purpose: Tag a corpus                                                                 #
#########################################################################################

options( java.parameters = "-Xmx12G")



# Install packages
# install.packages("rJava")
# install.packages("openNLP")
# install.packages("NLP")
# install.packages("plyr")
# install.packages("magrittr")
# install.packages("dplyr")
# install.packages("tidyr")

# Install openNLPmodels from source
# install.packages("openNLPmodels.en", repos = "http://datacube.wu.ac.at/", type = "source")



# Load packages
library("NLP")
library("openNLP")
library("openNLPmodels.en")
library("plyr")
library("magrittr")
library("dplyr")
library("tidyr")


# Get files 
filenames <- Sys.glob("data/ceec-normalised/*.txt")


# Read in files
texts <- filenames %>%
    lapply(readLines) %>%
    lapply(paste0, collapse = " ") %>%
    lapply(as.String)


# Remove metadata, numbers, and punctuation
texts <- lapply(texts, function(x){
    x = gsub("<[^>]+>","", x)
    x = gsub("\\[.*?\\]", "", x)
    x = gsub("}\\]", "", x)
    x = gsub("\\d","", x) # get rid of numbers
    x = gsub("[^[:alnum:][:space:]']", "", x) # get rid of punctuation except for apostrophes
    x
})
    


# Name files according to file name
names(texts) <- basename(filenames)

str(texts, max.level = 1)


# Tag corpus
sent_token_annotator <- Maxent_Sent_Token_Annotator()
word_token_annotator <- Maxent_Word_Token_Annotator()
pos_tag_annotator <- Maxent_POS_Tag_Annotator()

corpus_tagged <- lapply(texts, function(x){
    y1 <- annotate(x, list(sent_token_annotator, word_token_annotator))
    y2 <- annotate(x, pos_tag_annotator, y1)
    y2w <- subset(y2, type == "word")
    tags <- sapply(y2w$features, '[[', "POS")
    r1 <- sprintf("%s/%s", x[y2w], tags)
    r2 <- paste(r1, collapse = " ")
    return(r2)  
})


# Separate words
corpus_tagged <- lapply(corpus_tagged, function(x){
   x = tolower(x) %>%
        strsplit(" ") %>%
       as.data.frame() %>%
   return()
})


corpus_tagged <- Map(cbind, corpus_tagged, text_id = names(corpus_tagged))


# Rename first column
corpus_tagged <- lapply(corpus_tagged, function(x){
    names(x)[1] <- "word/pos"
    x
})


# Turn into tbl_df dataframe
corpus_tagged <- corpus_tagged %>%
    rbind.fill() %>%
    tbl_df()


# Separate first column
corpus_tagged  <- separate(corpus_tagged, "word/pos", into = c("word", "pos"), sep = "/" ) 


# create lookup table 
lookup <- c(cc = "coordinating conjunction", cd = "cardinal number", dt = "determiner", ex = "existential there", fw = "foreign word", `in` = "preposition or subordinating conjunction", jj = "adjective", jjr = "adjective, comparative", jjs = "adjective, superlative", ls = "list item marker", md = "modal", nn = "noun, singular or mass", nns = "noun, plural", nnp = "proper noun, singular", nnps = "proper noun, plural", pdt = "predeterminer", pos = "possesive ending", prp = "personal pronoun", `prp$` = "possessive pronoun", rb = "adverb", rbr = "adverb, comparative", rbs = "adverb, superlative", rp = "particle", sym = "symbol", to = "to", uh = "interjection", vb = "verb, base form", vbd = "verb, past tense", vbg = "verb, gerund or present participle", vbn = "verb, past participle", vbp = "verb, non-3rd sing", vbz = "verb, 3rd sing", wdt = "wh-determiner", wp = "wh-pronoun", `wp$` = "possessive wh-pronoun", wrb = "wh-adverb" )


# Apply lookup table
corpus_tagged$pos <- lookup[corpus_tagged$pos]


# Save results
saveRDS(corpus_tagged, "output/tagged_corpus.rds")











