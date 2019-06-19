
model{
mu ~ dnorm(0,.00001)
sigma ~ dunif(0,20)
for(i in 1:length(y.obs)){
  y.obs[i] ~ dnorm(mu, sigma^-2)
}
for(i in 1:(N-n)){
  y.miss[i] ~ dnorm(mu, sigma^-2) #simulate missing data
}
y.bar = n/N * mean(y.obs) + (N-n)/N * mean(y.miss)
} #end of model

