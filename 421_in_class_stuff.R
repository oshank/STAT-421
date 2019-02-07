p <- .7  #probability of arrival
q <- .7  #prob of departure
iter <- 200
xCur <- 5
xVec <- numeric(iter + 1)
xVec[1] <- xCur

for(i in seq(1, iter))
{
  if(xCur == 0){
    jump <- sample(x = c(0,1), size = 1, prob = c(1-p,p))
    xCur <- xCur + jump
  }
  else{
    jump <- sample(x = c(-1, 0, 1), size = 1, prob = c((1-p)*q,(1-p)*(1-q)+p*q,p*(1-q)))
    xCur <- xCur + jump
  }
  xVec[i+1] <- xCur
}


##########################################
p <- .7  #probability of arrival
q <- .7  #prob of departure
iter <- 200
numChains <- 500
xMtx <- matrix(0, nrow = numChains, ncol = iter+1)

for(i in seq(1, numChains))
{ 
  xCur <- 5
  xMtx[i,1] <- xCur
  for(j in seq(1, iter))
  {
    if(xCur == 0){
      jump <- sample(x = c(0,1), size = 1, prob = c(1-p,p))
      xCur <- xCur + jump
    }
    else{
      jump <- sample(x = c(-1, 0, 1), size = 1, prob = c((1-p)*q,(1-p)*(1-q)+p*q,p*(1-q)))
      xCur <- xCur + jump
    }
    xMtx[i,j+1] <- xCur
  }
}


