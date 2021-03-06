install.packages("wordcloud")
library(wordcloud)
# install.packages("twitteR")
# library(twitteR)
#  # retrieve the first 200 tweets (or all tweets if fewer than 200) from the
#  # user timeline of @rdatammining
#  rdmTweets <- userTimeline("rdatamining", n=200)
#  (nDocs <- length(rdmTweets))
# df <- do.call("rbind", lapply(rdmTweets, as.data.frame))
# myCorpus <- Corpus(VectorSource(df$text))
#  # convert to lower case
#  myCorpus <- tm_map(myCorpus, tolower)
#  # remove punctuation
#  myCorpus <- tm_map(myCorpus, removePunctuation)
#  # remove numbers
#  myCorpus <- tm_map(myCorpus, removeNumbers)
#  # remove URLs
#  removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
#  myCorpus <- tm_map(myCorpus, removeURL)
#  # add two extra stop words: "available" and "via"
#  myStopwords <- c(stopwords('english' ), "available", "via")
#  # remove "r" and "big" from stopwords
#  myStopwords <- setdiff(myStopwords, c("r", "big"))
#  # remove stopwords from corpus
#  myCorpus <- tm_map(myCorpus, removeWords, myStopwords)
# 
# myCorpus <- tm_map(myCorpus, gsub, pattern="miners", replacement="mining")
# myTdm <- TermDocumentMatrix(myCorpus, control=list(wordLengths=c(1,Inf)))
#  m <- as.matrix(myTdm)
#  # calculate the frequency of words and sort it descendingly by frequency
#  wordFreq <- sort(rowSums(m), decreasing=TRUE)
#  # word cloud
#  set.seed(375) # to make it reproducible
#  grayLevels <- gray( (wordFreq+10) / (max(wordFreq)+10) )
#  
# wordFreq <- sort(rowSums(as.matrix(tdm)), decreasing=TRUE)
# wordFreq <- c(wordFreq[wordFreq<50],"R"=100,"in"=80,"text"=100,"mining"=110,"data"=50,"analysis"=48)
# set.seed(3)
# wordcloud(words=names(wordFreq[wordFreq<=110]), freq=wordFreq[wordFreq<=110], rot.per=.2,min.freq=3, max.words=100,random.order=F)
# #13,23,32 dla wielkosmi mining-100
# 
# 
# 
# ?wordcloud



reut21578 <- system.file("texts", "crude", package = "tm")
r <- Corpus(DirSource(reut21578),
            readerControl = list(reader = readReut21578XML))
r[[1]]
as.PlainTextDocument(r[[1]])

docs <- data.frame(docs = c("This is a text.", "This another one."),
                   row.names = c("Text 1", "Text 2"))
(ds <- DataframeSource(docs))
inspect(Corpus(ds))
DirSource(system.file("texts", "txt", package = "tm"))

data("crude")
tdm <- TermDocumentMatrix(crude)
install.packages("proxy")
library(proxy)

dissimilarity(tdm, method = "cosine")
dissimilarity(crude[[1]], crude[[2]], method = "eJaccard")

findAssocs(tdm, c("oil", "opec", "xyz"), c(0.7, 0.75, 0.1))
findFreqTerms(tdm, 10, 14)

getTokenizers()
getTransformations()

sapply(ovid, length)
ovidChunks <- makeChunks(ovid, 5)
inspect(ovidChunks)
sapply(ovidChunks, length)
x <- tm_map(crude, stemDocument, lazy = TRUE)
inspect(x)
x <- materialize(x)
inspect(x)

meta(crude[[1]])
DublinCore(crude[[1]])
meta(crude[[1]], tag = "Topics")
meta(crude[[1]], tag = "Comment") <- "A short comment."
meta(crude[[1]], tag = "Topics") <- NULL
DublinCore(crude[[1]], tag = "creator") <- "Ano Nymous"
DublinCore(crude[[1]], tag = "Format") <- "XML"
DublinCore(crude[[1]])
meta(crude[[1]])
meta(crude)
meta(crude, type = "corpus")
meta(crude, "labels") <- 21:40
meta(crude)

source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")
f <- findFreqTerms(dtm, 10)
rownames(findAssocs(dtm, "opec", 0.5))

prescindMeta(crude, c("ID", "Heading"))

plot(tdm,corThreshold = 0.5, weighting = TRUE)

readPlain
25
Control parameters for engine
"custom"
are as follows.
info
a function extracting meta data from a
PDF
. The function must accept a file path as first
argument and must return a named list with the components
Author
(as character string),
CreationDate
(of class
 POSIXlt
),
Subject
(as character string),
Title
(as character string),
and
Creator
(as character string).
text
a function extracting content from a
PDF
. The function must accept a file path as first argu-
   ment and must return a character vector.
Value
A
function
with the signature
elem, language, id
:
   elem
a list with the named component
uri
which must hold a valid file name.
language
a string giving the text’s language.
id
a unique identification string for the returned text document.
The function returns a
PlainTextDocument
representing the text and meta data extracted from
elem$uri
.
Author(s)
Ingo Feinerer
See Also
getReaders
to list available reader functions.
Examples
uri <- system.file(file.path("doc", "tm.pdf"), package = "tm")
if(all(file.exists(Sys.which(c("pdfinfo", "pdftotext"))))) {
   pdf <- readPDF(control = list(text = "-layout"))(elem = list(uri = uri),
                                                    language = "en",
                                                    id = "id1")
   pdf[1:13]
}
Corpus(URISource(uri),
       readerControl = list(reader = readPDF(engine = "ghostscript")))
getReaders()

df <- data.frame(contents = c("content 1", "content 2", "content 3"),
                 title = c("title 1" , "title 2" , "title 3" ),
                 authors = c("author 1" , "author 2" , "author 3" ),
                 topics = c("topic 1" , "topic 2" , "topic 3" ),
                 stringsAsFactors = FALSE)
m <- list(Content = "contents", Heading = "title",
          Author = "authors", Topic = "topics")
myReader <- readTabular(mapping = m)
ds <- DataframeSource(df)
elem <- getElem(stepNext(ds))
(result <- myReader(elem, language = "en", id = "id1"))
meta(result)
inspect(removeSparseTerms(tdm, 0.5))
sFilter(crude, "heading =='DIAMOND SHAMROCK (DIA) CUTS CRUDE PRICES'")
sFilter(crude, "Places =='usa'")

stemCompletion(c("compan", "entit", "suppl"), crude)
(s <- stemDocument(crude[[1]]))
stemCompletion(s, crude)
stopwords("en")

termFreq(crude[[14]])
repo <- TextRepository(crude)
summary(repo)
RepoMetaData(repo)

data("acq")
summary(c(acq, crude))
summary(c(acq[[30]], crude[[10]]))
c(TermDocumentMatrix(acq), TermDocumentMatrix(crude))

tm_filter(crude, FUN = function(x) any(grep("co[m]?pany", x)))

tm_map(crude, stemDocument)
## Generate a custom transformation function which takes the heading
## as new content
headings <- function(x)
   PlainTextDocument(Heading(x), id = ID(x), language = Language(x))
inspect(tm_map(crude, headings))

funs <- list(stripWhitespace, removePunctuation, tolower)
tm_map(crude, FUN = tm_reduce, tmFuns = funs)[[1]]

tm_term_score(acq[[1]], c("company", "change"))

MC_tokenizer(crude[[1]])
scan_tokenizer(crude[[1]])

inspect(weightBin(tdm))

inspect(tdms <- TermDocumentMatrix(crude,
                                   control = list(removePunctuation = TRUE,
                                                  stopwords = TRUE,
                                                  weighting = function(x)
                                                     weightSMART(x, spec = "ntc"))))
as.vector(tdms[,1])%*%as.vector(tdms[,2])
as.matrix(tdms)
(macierzpodobienstw <- t(as.matrix(tdms))%*%as.matrix(tdms))

meta(crude)

m <- DocumentTermMatrix(acq)
Zipf_plot(m)
Heaps_plot(m)
