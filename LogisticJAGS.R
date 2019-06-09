 
model {

  # priors

  K ~ dunif(0, 4000)
  r ~ dunif (0, 2)
  sigma ~ dunif(0, .5) 
  tau <- 1/sigma^2
  
  # likelihood
  
  for(i in 1:n) {
    mu[i] <- r - r/K * x[i]
    y[i] ~ dnorm(mu[i], tau)
  }

  # derived quantities	

  # calculate maximum growth rate	
  N_at_maxdNdt <- K/2
  
  # calculate growth rate over range of N values. N must be read in as data:
  for (j in 1:length(N)) {
    dNdt[j] <- r * N[j] * (1 - N[j]/K)
  }
} 

