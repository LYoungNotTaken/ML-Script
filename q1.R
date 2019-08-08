library("jiebaR")
wk = worker()
wk<-worker(stop_word="chineseStopWords.txt")

segment<-wk
freq(segment)




show_dictpath()
dir(show_dictpath())
scan(file="/Library/Frameworks/R.framework/Versions/3.5/Resources/library/jiebaRD/dict/user.dict.utf8",
     what=character(),nlines=50,sep='\n',
     encoding='utf-8',fileEncoding='utf-8')




setwd("D:/Rcourse/Take-Home Test II")

library(readxl)
# install.packages("jiebaR")
# install.packages("plyr")
# install.packages("Rcpp")

library(jiebaRD)
library(jiebaR)
library(plyr)
library(rJava)
library(Rwordseg)

gov<-scan(file.choose(),sep="\n",what="",encoding="UTF-8")
test1=gov[gov!=" "]

test1=gsub(pattern="http:[a-zA-Z\\/\\.0-9]+","",test1)
test1=gsub(pattern="[???|???|???|???|??????|??????|??????|??????|??????|??????|??????|??????|??????|??????]","",test1)
test1=gsub(pattern="/^[^0-9]*$/","",test1)
test1=gsub('[a-zA-Z]','',test1)

wk = worker()
segment<-wk[test1]

write.csv(file = "govsegment.csv",segment)