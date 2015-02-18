setwd("scratch/nikkei_sse/")

n=read.csv("nikkei.csv")
n$Date<-as.Date(n$Date)
n<-n[nrow(n):1,]
prev<-head(n$Adj.Close,-1)
prev<-c(NaN,prev)
n$Prev.Adj.Close<-prev
n$delta<-(n$Adj.Close-n$Prev.Adj.Close)/n$Prev.Adj.Close

s=read.csv("sse.csv")
s$Date<-as.Date(s$Date)
s<-s[nrow(s):1,]
prev<-head(s$Adj.Close,-1)
prev<-c(NaN,prev)
s$Prev.Adj.Close<-prev
s$delta<-(s$Adj.Close-s$Prev.Adj.Close)/s$Prev.Adj.Close

deltas<-merge(n[,c('Date','delta')],s[,c('Date','delta')],by='Date')
deltas<-tail(deltas,-1)

cor(deltas$delta.x, deltas$delta.y)
cov(deltas$delta.x, deltas$delta.y)
