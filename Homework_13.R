

# Need random var to produce arrivals
# lambda = 1/4


# Need random var to find "Jump size"
# Y ~ Pois(mu = 2)


rateParam = 1/4
jumpsize <- 0

listtime <- list()
listjump <- list()
listsums <- list()


for(j in 1:1000){
  i <-0
  time<-0
  
  totaljump <- numeric()
  sumjump <- numeric()

  arrivalTimes <- numeric() 
  
  while(time < 100)
  {
    i <- i + 1
    waitTime <- rexp(1, rate = rateParam)
  
    time <- time + waitTime
  
    arrivalTimes[i] <- time
  
    # Jump size rv
    jumpsize <- rpois(1, 2)
    # Adding jumpsize to end of vector 
    # need to catch the first itteration because we cant have a index of 0
    if (i == 1){
      sumjump[i] <- jumpsize
    } else {
      sumjump[i] <- sumjump[i-1] + jumpsize
    }
    
    # indivdual jumps at time
    totaljump[i] <- jumpsize
  
  }
  
  listjump[[j]] <- totaljump
  listtime[[j]] <- arrivalTimes
  listsums[[j]] <- sumjump
  
}


plot(listtime[[9]], listsums[[9]], type = "s", xlab = "Time", ylab = "Total Arrivals")



# E(x(10))
x10 <- numeric()

for(i in 1:length(listjump)){
  
  j <- 1
  
  while(TRUE){
    
    if(listtime[[i]][j] <= 10){
      
      j <- j + 1
      
    } else {
      
      if(j == 1){
        x10[i] <- 0
      } else {
        x10[i] <- listsums[[i]][j-1]
      }
      break;
      
    } 
    
  }
  
  
}

mean(x10)
var(x10)


# P( X(5) = 2)


x5 <- numeric()

for(i in 1:length(listjump)){
  
  j <- 1
  
  while(TRUE){
    
    if(listtime[[i]][j] <= 5){
      
      j <- j + 1
      
    } else {
      
      if(j == 1){
        x5[i] <- 0
      } else {
        x5[i] <- listsums[[i]][j-1]
      }
      break;
      
    } 
    
  }
  
}

mean(x5 == 2)








