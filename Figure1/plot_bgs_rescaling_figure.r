
#Load these data from excel sheet
B_obs_mean <- c(0.7395, 0.7300, 0.6817, 0.5495)
B_obs_sd <- c(0.0092, 0.0083, 0.0086, 0.0070)
B_exp <- 0.74

#color 1
myplot <- barplot(B_obs_mean, col="deepskyblue3", ylab=expression(italic("B")), xlab=expression(italic("C")), names.arg=c("100", "200", "500", "1000"), ylim=c(0, 1))
arrows(myplot,B_obs_mean+B_obs_sd, myplot, B_obs_mean-B_obs_sd, angle=90, code=3)
abline(a=B_exp, b=0, col="black")

#color 2
myplot <- barplot(B_obs_mean, col="steelblue3", ylab=expression(italic("B")), xlab=expression(italic("C")), names.arg=c("100", "200", "500", "1000"), ylim=c(0, 1))
arrows(myplot,B_obs_mean+B_obs_sd, myplot, B_obs_mean-B_obs_sd, angle=90, code=3)
abline(a=B_exp, b=0, col="black")

>>save as 4 x 6 inch