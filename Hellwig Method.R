dane <- read.csv("halo.csv")

dane <- dane[,c(-1, -9, -10)]



hellwig <- function(y, x)
{
  n <- ncol(x)
  l <- (2^n)-1
  
  R0 <- cor(y, x)
  R <- as.matrix(cor(x))
  
  argument <- replicate(n, c(0, 1), simplify = FALSE)
  comb <- as.matrix(expand.grid(argument))
  comb <- comb[-1,]
  
  h <- matrix(0, l, n)
  
  for(i in 1:l) 
  {
    for(j in 1:n)
    {
      h[i,j] <- (comb[i, j] * (R0[j]^2))/ (comb[i,] %*% as.vector(R[,j]))
      #h[i,j]=((R0[j]^2)*comb[i,j])/( as.vector(comb[i,]) %*% (as.vector(R[,j])))
    }
  }
  
  
  #index <- which(rowSums(h) == max(rowSums(h)))
  
  maks=which.max(rowSums(h))
  
  return(comb[maks,])
}


hellwig(dane[, 1], dane[, -1])
