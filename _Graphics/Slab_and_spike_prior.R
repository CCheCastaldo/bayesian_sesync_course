setwd("/Users/Tom/Documents/Teaching/BayesianShortCourse 2/_Graphics/")
pdf(file="Slab_and_Spike_Prior.pdf", height=5, width=5)
x=seq(-50,50,.01)
par(mar=c(5, 6, 4, 2) + 0.1)
y=dnorm(x, mean=0,sd=5)
plot(x,y, xlab=expression(beta), xfont="Times", typ="l", labels=TRUE, space=1.5, ylab="Probability Density", lwd.ticks=0, cex.lab=1.5, col="blue", lwd=2, main="Slab and spike prior",xlim = c(-10,10),ylim=c(0,1))
y=dnorm(x, mean=0,sd=.4)
lines(x,y, xlab=expression(beta), xfont="Times", typ="l", labels=FALSE, space=1.5, ylab="Probability Density", lwd.ticks=0, cex.lab=1.5, lwd=2, col="red")
dev.off()


# j=seq(2,2.4,length=length(y))
# polygon(c(2,j,2.4),c(0,dnorm(j,3,.9),0),col="lightgray",border=NA)


# segments(2,0,2,dnorm(2,3,.9))
# segments(2.4,0,2.4,dnorm(2.4,3,.9))
