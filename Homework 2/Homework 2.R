#problem 1a

iter <- 1000
xVec <- numeric(iter+1)

X_0 <- sample(c(1,2,3,4), 1, prob = c(.5,.5,0,0))
xVec[1]<-X_0

curval <- X_0

for(i in seq(1, iter))
{
  if(curval == 1){
    nextVal <- sample(c(1,2,3,4), 1, prob = c(.1, .2, .3, .4))}
  else if(curval == 2){
    nextVal <- sample(c(1,2,3,4), 1, prob = c(.3, 0, .4, .3))}
  else if(curval == 3){
    nextVal <- sample(c(1,2,3,4), 1, prob = c(.1, .1, .7, .1))}
  else{
    nextVal <- sample(c(1,2,3,4), 1, prob = c(.25, .25, .25, .25))
  }
  xVec[i+1] <- nextVal  #stores in xVec
  curval <- nextVal     #switches role to repeat
}


xVec
sum(xVec == 1)/length(xVec)
sum(xVec == 2)/length(xVec)
sum(xVec == 3)/length(xVec)
sum(xVec == 4)/length(xVec)
