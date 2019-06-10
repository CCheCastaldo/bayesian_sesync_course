
model{

  # priors
  # hyperpriors
    mu.alpha ~ dnorm(0,.00001)  
    sigma.alpha ~ dunif(0,200) #notated as varsigma in model documentation
    tau.alpha <- 1 / sigma.alpha^2
    
    # priors
    for(j in 1:n.sites) {
    alpha[j] ~ dnorm(mu.alpha, tau.alpha)  
    }
    beta ~ dnorm(0,.0001)
    sigma ~ dunif(0,100)
    tau.reg <- 1 / sigma^2
    
    # likelihood
    # note that the data have been log-transformed in R prior to running this model
    
    for (i in 1:length(log.emission)) {
    log_mu[i] <- alpha[group[i]] + beta * log.n.input.centered[i]
    log.emission[i] ~ dnorm(log_mu[i], tau.reg)
    
    # simulated data for posterior predictive checks
    log.emission.sim[i] ~ dnorm(log_mu[i], tau.reg) 
    sq.error.data[i] <- (log.emission[i] - log_mu[i])^2
    sq.error.sim[i] <- (log.emission.sim[i] - log_mu[i])^2
  }

  # bayesian p values
  sd.data <- sd(log.emission)
  sd.sim <- sd(log.emission.sim)
  p.sd <- step(sd.sim - sd.data)

  mean.data <- mean(log.emission)
  mean.sim  <- mean(log.emission.sim)
  p.mean <- step(mean.sim - mean.data)

  discrep.data <- sum(sq.error.data)
  discrep.sim <- sum(sq.error.sim)
  p.discrep <- step(discrep.sim - discrep.data)

  min.data <- min(log.emission)
  min.sim <- min(log.emission.sim)
  p.min <-step(min.sim - min.data)

}
    

