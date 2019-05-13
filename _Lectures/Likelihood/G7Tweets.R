consumerKey <- "rVLfYgZXtHcMJwUwGQ3Er8cQS"
consumerSecret <- "E6tOCRZ2r00TvWMLganKmP4Ux2V6W58enU1mPzPtcvZZSzHAJ8"
accessToken <- "2541926305-XLiEHQDnIR9AMkYvg7CnaNm7bbVCHtZvq7il6R4"
accessTokenSecret <- "9gPUqGsMB5un2ECWmdXxbqNhLroejH43yx1DN4xS1Pl9S"

library(twitteR)

howManyTweets <- function(handle) {
  
  setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)

  a <- getUser(handle)

  b <- userTimeline(a, n = 3200, includeRts = TRUE, excludeReplies =FALSE)

  tweetsdf <- twListToDF(b)

  c <- subset(tweetsdf, created >= as.POSIXct('2017-01-20 14:00:00') & created <= as.POSIXct('2017-07-20 00:00:00'))
  
  d <- c(dim(c)[1]/151, 1/(dim(c)[1]/151))
  
  return(c)

}

work1 <- howManyTweets("realDonaldTrump")
howManyTweets("AbeShinzo")
howManyTweets("EmmanuelMacron")
howManyTweets("theresa_may")
howManyTweets("PaoloGentiloni")
howManyTweets("JustinTrudeau")
howManyTweets("AngelaMerkeICDU")

work1 <- howManyTweets("realDonaldTrump")

wait <- NA

for(i in 2:dim(work1)[1]){

    wait[i-1] <- difftime(work1$created[i-1], work1$created[i] , units = "days")
}

length(wait)/sum(wait)

x <- seq(1, 10, length = 1000)

y <- NA

for(i in 1:length(x)) {y[i] <- prod(dexp(wait, x[i]))}

plot(x,y, lwd = 2)



