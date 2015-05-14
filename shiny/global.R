library(tm)
library(wordcloud)
library(memoise)
library(shiny)
library(RColorBrewer)

# Place data in the same directory


# The list of valid letters
years <- list("Before 1700" = "period1",
              "1700-1719" = "period2",
               "After 1719" = "period3")

# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(year) {
    # Careful not to let just any name slip in here; a
    # malicious user could manipulate this value.
    if (!(year %in% years))
        stop("Unknown year")
    
    text <- readLines(sprintf("./%s.txt", year),
                      encoding="UTF-8")
    
    my_corpus = Corpus(VectorSource(text))
    my_corpus = tm_map(my_corpus, content_transformer(tolower))
    my_corpus = tm_map(my_corpus, removePunctuation)
    my_corpus = tm_map(my_corpus, removeNumbers)
    my_corpus = tm_map(my_corpus, removeWords,
                      c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))
    
    myDTM = TermDocumentMatrix(my_corpus,
                               control = list(minWordLength = 1))
    
    m = as.matrix(myDTM)
    
    sort(rowSums(m), decreasing = TRUE)
})