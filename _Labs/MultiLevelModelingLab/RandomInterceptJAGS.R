
model{

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
  }

  # predicted emissions across all sites as derived quantities
  alpha_pred ~ dnorm(mu.alpha, tau.alpha)
  for (i in 1:length(log.n.input.centered.pred)) {
    log_mu_pred[i] <- alpha_pred + beta * log.n.input.centered.pred[i]
    mu_pred[i] <- exp(log_mu_pred[i])
  }

  # predicted emissions for each site as derived quantities
  for (i in 1:length(log.n.input.centered.pred)) {
    for (j in 1:n.sites) {
      log_mu_site_pred[i, j] <- alpha[j] + beta * log.n.input.centered.pred[i]
    }
  }

}
    

