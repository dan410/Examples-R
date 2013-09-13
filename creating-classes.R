# Here is some code demonstrating how S3 classes work in R
# There are S4 classes that are more formal, more complicated, more powerful, but are generally discouraged

df <- data.frame(x1 = rnorm(100), x2 = runif(100), x3 = rpois(100, lambda=3), x4 = rchisq(100, df = 5))

class(df)
plot(df)

# define a plot funciton for objects of class 'myclass'
plot.myclass <- function(obj){
	op <- par(mfrow = c(2,2)) #set graphic parameter for a 2X2 matrix of plots
	hist(obj$x1, main="Normal")
	hist(obj$x2, main = "Uniform")
	hist(obj$x3, main = "Poisson")
	hist(obj$x4, main = "Chi Square")	
	par(op) #reset graphics parameter
}


class(df) <- "myclass"
str(df)

plot(df)

# When R runs plot(df) it looks at the value of class(df) and reads "myclass", it then looks to see if there is plot function for this class defined by plot.myclass(). If it finds plot.myclass(), then it runs plot.myclass(df). If it doesn't find a plotting funciton it does its best to create an appropriate plot. 

class(df) <- "foo"
plot(df)

class(df) <- "data.frame"
plot(df)

# type plot -without parentheses- and R will show you the underlying code. You will see "UseMethod('plot')". Type mean and you will see the same thing..."UseMethod('mean')". These functions are called 'generic' functions, and you can define how these function behave for your object class. This means you can create mean.myclass() and call it by using the mean() function.

mean(df)

mean.myclass <- function(obj){
	
	print('how dow I want ot define mean for myclass objects?')
}

class(df) <- "myclass"
mean(df)





