P <- matrix(c(0,1,0,0,1/9,4/9,4/9,0,0,4/9,4/9,1/9,0,0,1,0), byrow = T, nrow = 4)
P

eigenOut<-eigen(P)
D <- matrix(c(eigenOut$values[1],0,0,0,
              0,eigenOut$values[2],0,0,
              0,0,eigenOut$values[3],0,
              0,0,0,eigenOut$values[4]), byrow = T, nrow = 4)
X<-(eigenOut$vectors)
X_inv <- solve(X)
D


X%*%D^1000%*%X_inv
