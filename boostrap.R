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
  index <- which(pvec[, -1] > alpha)
  if(length(index) != 0)
  {
      dane <- dane[, -(index + 1)]
      bootstrap(dane)
  }
  else
  {
    return(dane)
  }
}
#############################################
xxx <- bootstrap(dat, 0.3, 10^3)
head(xxx)
dat <- read.csv("dane mpg.csv")
dat <- dat[, -c(1, 8, 9, 10)]


bootstrap(dat)



