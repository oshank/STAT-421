

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

# E(x(10))


for(length of list){
  
  
  for(length of list entry){
    
    
    
  }
  
  
}


