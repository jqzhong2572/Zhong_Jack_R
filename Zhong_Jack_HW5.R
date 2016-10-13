library('ggplot2')
data <- data.frame(diamonds)


#1 
structure(data)
str(data)
methods(data.frame)
ncol(data)

#2
nrow(data)


#3
writeLines(colnames(data))
    # Use function writelines to print the column names seperated by newline.


#4
print(lapply(data, class))
    # Apply function class to columns using lapply.


#5
data_refine <- na.omit(data)
    # I want to get rid of the rows with incomplete information
print(lapply(data_refine[, sapply(data_refine, is.numeric)],mean))
    # First, sapply(data, is.numeric)] performe is.numeric on columns in dataframe, and get a vector of TRUE and FALSE.
    # Secondly, pick out the columns returning TRUE.
    # Thirdly, apply function mean to those columns.


#6
print(lapply(data_refine[, sapply(data_refine, is.factor)], table))
    # It is similarly to question 5. 
    # But this time we use function table on the desired columns to get frequency list.


#7
# Number of rows containing an NA
print(sum(apply(is.na(data), 1, any)))
# Percentage of rows containing an NA
cat(c(100 * sum(apply(is.na(data), 1, any) / nrow(data)), '%'), sep = '')
    # First, is.na(data) change every element to TRUE or FALSE whether it is NA
    # Secondly, apply(is.na(data), 1, any) return a list stating if the rows have at least 1 TRUE
    # Thirdly, calculate the sum of number of rows with TRUE and divide it by number of rows
    # Fourthly, get percentage format by multiplying 100 and add a '%' sign


#8
install.packages('dplyr') # Only have to run once.
library(dplyr)
library(reshape2)
my.function <- function(data)
{
  data_refine <- na.omit(data)
  cor <- cor(data2_refine[sapply(data2_refine, is.numeric)],method="pearson")
  cor <- as.matrix(cor)
  data_cor_melt <- arrange(melt(cor))

  

}



?apply
??attributes
#watch G's vid around "difference between R and python"



d <- data.frame(x1=rnorm(10),
                x2=rnorm(10),
                x3=rnorm(10))
d_cor <- as.matrix(cor(d))
d_cor_melt <- arrange(melt(d_cor))
