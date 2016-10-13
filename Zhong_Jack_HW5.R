library('ggplot2')
data(diamonds)
data <- data.frame(diamonds)


#1 
methods(class=data.frame)
attributes(data)
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
data_num <- data[sapply(data, is.numeric)]
lapply(data_num,mean,na.rm=TRUE)
    # First, sapply(data, is.numeric)] performe is.numeric on columns in dataframe, and get a vector of TRUE and FALSE.
    # Secondly, pick out the columns returning TRUE.
    # Thirdly, apply function mean to those columns.
    # I want to get rid of the rows with incomplete information.

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
corr <- function(data) {
  data_refine <- na.omit(data)
    # Get rid of junks
  cor_matrix <- cor(data_refine[sapply(data_refine, is.numeric)],method="pearson")
    # Calculate correlation only on numeric columns
  cor <- as.data.frame(as.table(cor_matrix))
    # Change it to a data frame
  combinations = combn( colnames( cor_matrix ) , 2 , FUN = function( x ) { paste( x , collapse = "_" ) } )
  cor <-  cor[ cor$Var1 != cor$Var2 , ]
  cor <-  cor[ paste( cor$Var1 , cor$Var2 , sep = "_" ) %in% combinations , ]
    # These get rid of the 1s in diagnal and duplicates
  cor[,1] = paste(cor$Var1 , cor$Var2 , sep = "-")
    # Modify column 1 names
  cor[,2] <- NULL
    # Delete column 2
  colnames(cor) <- c("variables", "corr")
    # Modify column name
  return (cor)
}

corr(data)
