my_prob <- function(nn, mm, pp){

  endTurn <- numeric()
  p <- pp
  n <- nn
  m <- mm
  count <- 0

  for(i in seq(1:m)){

    x0 <- 5
    j <- 1

    while((x0 >= 5)&&(count<=n)){

      draw <- sample(c(0,1),1,prob = c(1-p,p))

      if((draw == 1) && (j < n)){
        x0 <- x0 + 1
        j <- j + 1
      }else{
        x0 <- 0
        endTurn[i] <- j
      }
    }
  }
  mean(endTurn)
}

my_prob_2 <- function(mm, pp){
  
  endTurn <- numeric()
  p <- pp
  m <- mm
  count <- 0
  
  for(i in seq(1:m)){
    
    x0 <- 5
    j <- 1
    
    while((x0 >= 5)){
      
      draw <- sample(c(0,1),1,prob = c(1-p,p))
      
      if((draw == 1)){
        x0 <- x0 + 1
        j <- j + 1
      }else{
        x0 <- 0
        endTurn[i] <- j
      }
    }
  }
  mean(endTurn)
}

unchecked_mean <- numeric()
checked_mean <- numeric()

for(i in seq(1:1000)){
  unchecked_mean[i] <- my_prob_2(1000, .9)
}
mean(unchecked_mean)

for(i in seq(1:1000)){
  checked_mean[i] <- my_prob(20, 1000, .9)
}
mean(checked_mean)


# my_prob(20, 10000, .9)
# my_prob_2(10000, .9)

