#############################################
boot_coef <- function(dane)
{
    boot_sample <- sample(1:nrow(dane), 
                          nrow(dane), 
                          replace = T)
    model <- lm(lp100km ~ ., data = dane[boot_sample, ])
    return(coef(model))
}
#############################################
bootstrap <- function(dane, alpha = 0.05, n = 10^4)
{
  #alpha <- 0.05
  coefs <- sapply(rep(1, n), function(x) boot_coef(dane))
  conf_inter <- apply(coefs, 1, function(x) quantile(x, c(alpha/2, 1-alpha/2)) )
  
  pvec<- data.frame("const" = NA, "cylinders" = NA, "displacement" = NA, "horsepower" = NA, "weight" = NA, "accelaration" = NA)
  
  coefs <- t(coefs)
  for(i in 1:ncol(conf_inter))
  {
    if(mean(conf_inter[1,i], conf_inter[2,i]) > 0)
    {
      pvec[, i] <- length(coefs[coefs[, i] <0 , i]) / n
    }
    else
    {
      pvec[, i] <- length(coefs[coefs[, i] > 0, i]) / n
    }
  }
  index <- 0
  pvec <- as.numeric(pvec[, -1])
  index <- which(pvec > alpha)
  
  #index <- which(pvec[index == max(pvec)])
  if(length(index) != 0)
  {
      index <- which(pvec == max(pvec, na.rm = TRUE))
      dane <- dane[, -(index + 1)]
      bootstrap(dane, alpha, n)
  }
  else
  {
    return(dane)
  }
}
#############################################
xxx <- bootstrap(dat, 0.05, 10^5)
head(xxx)
dat <- read.csv("dane mpg.csv")
dat <- dat[, -c(1, 8, 9, 10)]
head(dat)

bootstrap(dat)



a <- c(4, 3, 2, 1)
which(a == max(a))
a[max(a)]
      