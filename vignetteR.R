install.packages("tm")
library(tm)
txt <- system.file("texts", "txt", package = "tm")
(ovid <- Corpus(DirSource(txt, encoding = "UTF-8"), readerControl = list(language = "lat")))

docs <- c("This is a text.", "This another one.")
Corpus(VectorSource(docs))

reut21578 <- system.file("texts", "crude", package = "tm")
install.packages("XML")
library(XML)
reuters <- Corpus(DirSource(reut21578), readerControl = list(reader = readReut21578XML))
data("crude")
inspect(ovid)
summary(ovid)
print(ovid)
ovid[[2]]
ovid[["ovid_2.txt"]]
reuters <- tm_map(reuters, as.PlainTextDocument)
reuters <- tm_map(reuters, stripWhitespace)
reuters <- tm_map(reuters, tolower)
reuters <- tm_map(reuters, removeWords, stopwords("english"))
install.packages("SnowballC")
library(SnowballC)
reuters <- tm_map(reuters, stemDocument)
reuters
query <- "id =='237'& heading =='INDONESIA SEEN AT CROSSROADS OVER ECONOMIC CHANGE'"
tm_filter(reuters, FUN = sFilter, query)
#obiekt crude nie istnial(zamiast niego byl reuter)
DublinCore(crude[[1]], "Creator") <- "Ano Nymous"
meta(crude[[1]])
meta(crude, tag = "test", type = "corpus") <- "test meta"
meta(crude, type = "corpus")
meta(crude, "foo") <- letters[1:20]
meta(crude)
dtm <- DocumentTermMatrix(reuters)
dim(dtm)
inspect(dtm[1:10,100:105])
findFreqTerms(dtm, 10)
inspect(dtm[,c("oil","opec")])
cor(inspect(dtm[,c("oil")]),inspect(dtm[,c("opec")]))
findAssocs(dtm, "opec", 0.8)
inspect(DocumentTermMatrix(reuters, list(dictionary = c("prices", "crude", "oil"))))

