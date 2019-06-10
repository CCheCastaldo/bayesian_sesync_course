
model{

  # priors
  alpha ~ dnorm(0,.0001)
  beta ~ dnorm(0,.0001)
  sigma ~ dunif(0,100)
  tau.reg <- 1/sigma^2

  # likelihood
  # note that the data have been log-transformed in R prior to running this model
 
  for (i in 1:length(log.emission)) {
    log_mu[i] <- alpha + beta * log.n.input.centered[i]
    log.emission[i] ~ dnorm(log_mu[i], tau.reg)
  }

  # predicted emissions as derived quantities
  for (i in 1:length(log.n.input.centered.pred)) {
    log_mu_pred[i] <- alpha + beta * log.n.input.centered.pred[i]
    mu_pred[i] <- exp(log_mu_pred[i])
  }

}
    

