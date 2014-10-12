setwd("C:\\dev")

install.packages("tm")
library(tm)

install.packages("wordcloud")
library(wordcloud)

install.packages("Rstem")
library(Rstem)


txt <- readLines("text_data.txt")
#txt <- readLines(filetxt) # don't mind warning..

txt <- tolower(txt)
txt <- removeWords(txt, c("\\f", stopwords()))

corpus <- Corpus(VectorSource(txt))
corpus <- tm_map(corpus, removePunctuation)
tdm <- TermDocumentMatrix(corpus)
m <- as.matrix(tdm)
d <- data.frame(freq = sort(rowSums(m), decreasing = TRUE))

# Stem words
d$stem <- wordStem(row.names(d), language = "english")

# and put words to column, otherwise they would be lost when aggregating
d$word <- row.names(d)

# remove web address (very long string):
#d <- d[nchar(row.names(d)) < 20, ]

# aggregate freqeuncy by word stem and
# keep first words..
agg_freq <- aggregate(freq ~ stem, data = d, sum)
agg_word <- aggregate(word ~ stem, data = d, function(x) x[1])

d <- cbind(freq = agg_freq[, 2], agg_word)

# sort by frequency
d <- d[order(d$freq, decreasing = T), ]

# print wordcloud:
wordcloud(d$word, d$freq,scale=c(5,0.5), max.words=120, random.order=FALSE, 
	    rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))

# remove files
file.remove(dir(tempdir(), full.name=T)) # remove files