# Jack Zhong
# HW6

library(ggplot2)
library('grid')
  # we need both for the homework
data(diamonds)
data <- data.frame(diamonds)
  # put data in diamonds to dataframe 'data'

attach(data)
#2
ggplot(data, aes(carat, price)) + geom_point(aes(colour=factor(color))) +
      labs(title = "Diamonds - Weight to Price by Color", x = "Weight", y = "Price")
  # x axis is carat, y axis is price
  # use geom_point for scatter plot and mark colors using diamonds$color

#3
ggplot(data, aes(log(carat), log(price))) + geom_point(aes(colour=factor(color))) +
      labs(title = "Diamonds - Weight to Price (Linear)", x = "Weight", y = "Price")
  # do the same for log(carat) and log(price)


#4
lmfit <- lm(log(price) ~ log(carat), data = data)
  # find linear model of y = log(price) to x = log(carat) 
ggplot(data, aes(log(carat), residuals(lmfit))) + geom_point(aes(colour=factor(color))) +
  labs(title = "Diamonds - Weight to Price by Color", x = "Weight", y = "Price") +
  theme(legend.position = "top")
  # plot the y = residuals of linear model to x = log(carat) and use colors as I did above
  # change the title and x,y axis title
  # legend.position = "top" move the factor(price) to the top

#5
hist_price <- ggplot(data, aes(price,..density..)) + 
              geom_histogram(binwidth=30,aes(colour=factor(color))) +
              theme (axis.title.x=element_blank(), axis.title.y=element_blank(), legend.position="none")
  # find the density histogram for price with color as I did above
  # use binwitch=30 to get the required shape
  # use axis.title.x or y to get rid of axis, and legend.position='none' to remove factor(price)
hist_carat <- ggplot(data, aes(carat,..density..)) + 
              geom_histogram(binwidth=0.1,aes(colour=factor(color))) +
              theme (axis.title.x=element_blank(), axis.title.y=element_blank(), legend.position="none")
  # similar, but we use binwidth=0.1 because carat is a small number

vp1 <- viewport(width=0.4,height=0.2, x=0.28, y=0.2)
  # find the relative location of bottom left
vp2 <- viewport(width=0.4,height=0.2, x=0.82, y=0.74)
  # relative location of top right
print(hist_price, vp = vp1)
print(hist_carat, vp = vp2)
  # print the two graphs over what we had

