# Homework 3
# STAT 421

x0 <- 0
p <- .5
q <- 1-p
iter <- 200
numChains <- 3

xmtx <- matrix(0,numChains,iter+1)

for(i in seq(0,numChains)){
  
  xCur <- x0
  xmtx[i,1] <- xCur
  
  for(j in seq(1,iter)){
    
    jump <- sample(c(-1,1),1,T,c(p,q))
    xCur <- xCur + jump
    
    xmtx[i,j+1] <- xCur
    
    
  }
}



plot(xmtx[1,], type = "l", ylim = c(min(xmtx[]), max(xmtx[])), col = palette[1])
#lines(xmtx[2,], col = "green")
#lines(xmtx[3,], col = "blue")
palette <- distinctColorPalette(numChains)

for(i in seq(2, numChains)){
  lines(xmtx[i,], col = palette[i])
}