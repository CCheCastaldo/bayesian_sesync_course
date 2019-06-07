
model{

  # priors
  
  a ~ dnorm(0, 1.0E-6) 
  b ~ dnorm(0, 1.0E-6) 

  # likelihood
  
  for (i in 1:n) {
    logit(p[i]) <- a + b*x[i] 
    y[i] ~ dbern(p[i])
  }

} #end of model

