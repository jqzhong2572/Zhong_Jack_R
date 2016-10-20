# Jack Zhong
# HW6

library(ggplot2)
library('grid')
  # we need both for the homework
data(diamonds)
data <- data.frame(diamonds)
  # put data in diamonds to dataframe 'data'
attach(data)
  # makes my life easier


#2
ggplot(data, aes(carat, price)) + geom_point(aes(colour=factor(color))) +
      labs(title = "Diamonds - Weight to Price by Color", x = "Weight", y = "Price") +
      theme(plot.title=element_text(colour="blue", size=23))
  # x axis is carat, y axis is price
  # use geom_point for scatter plot and mark colors using diamonds$color
  # change title to blue and a bigger size

#3
data[,'log_carat'] <- log(carat)
data[,'log_price'] <- log(price)
  # add the transformed columns to the dataframe
ggplot(data, aes(log_carat, log_price)) + geom_point(aes(colour=factor(color))) +
      labs(title = "Diamonds - Weight to Price (Linear)", x = "Weight", y = "Price") +
      theme(plot.title=element_text(colour="blue", size=23))
  # do the same for log(carat) and log(price)


#4
lmfit <- lm(log_price ~ log_carat, data = data)
  # find linear model of y = log(price) to x = log(carat) 
ggplot(data, aes(log_carat, residuals(lmfit))) + geom_point(aes(colour=factor(color))) +
  labs(title = "Diamonds - Weight to Price by Color", x = "Weight", y = "Price Residuals") +
  theme(legend.position = "top", plot.title=element_text(colour="blue", size=20))
  # plot the y = residuals of linear model to x = log(carat) and use colors as I did above
  # change the title and x,y axis title
  # legend.position = "top" move the factor(price) to the top

#5
ggplot(data, aes(log_carat, residuals(lmfit))) + geom_point(aes(colour=factor(color))) +
  labs(title = "Diamonds - Weight to Price by Color", x = "Weight", y = "Price Residuals") +
  theme(legend.position = "top", plot.title=element_text(colour="blue", size=23)) +
  guides(col = guide_legend(nrow = 1))
  # same graph but make the legend appear in one row
hist_price <- ggplot(data, aes(price,..density..)) + 
              geom_histogram(binwidth=45,aes(colour=factor(color))) +
              theme (axis.title.x=element_blank(), axis.title.y=element_blank(), legend.position="none", 
                     plot.margin = unit(c(0, 0, 0, 0), "cm"))
  # find the density histogram for price with color as I did above
  # use binwitch=45 to get the required bin witdth
  # use axis.title.x or y to get rid of axis, and legend.position='none' to remove factor(price)
  # remove margin
hist_carat <- ggplot(data, aes(carat,..density..)) + 
              geom_histogram(binwidth=0.04,aes(colour=factor(color))) +
              theme (axis.title.x=element_blank(), axis.title.y=element_blank(), legend.position="none",
                     plot.margin = unit(c(0, 0, 0, 0), "cm"))
  # similar, but we use binwidth=0.04

vp1 <- viewport(width=0.4,height=0.2, x=0.25, y=0.16)
  # find the relative location of bottom left
vp2 <- viewport(width=0.4,height=0.2, x=0.78, y=0.8)
  # relative location of top right
print(hist_price, vp = vp1)
print(hist_carat, vp = vp2)
  # print the two graphs over what we had
  # You may zoom the graph and view it better this way

detach(data)
