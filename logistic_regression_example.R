# Logit example in Faraway (non-lin) page 27

library(faraway)
data(orings)

# Fitting the logit model
plot(damage/6 ~ temp, orings, xlim = c(25,85), ylim=c(0,1))
logitmod <- glm(cbind(damage, 6-damage) ~ temp, family=binomial, orings)
summary(logitmod)
x <- seq(25,85,1)
lines(x, ilogit(11.663 - 0.2162*x))

# Inference
pchisq(deviance(logitmod), df.residual(logitmod), lower=FALSE)

# Profile likelihood confidence interval for parameters
library(MASS)
confint(logitmod)

