#install packages and libraries
# whole tidyverse package
install.packages("tidyverse")
library(tidyverse)
# Useful for importing data
library(readr) 
#Useful for data wrangling
library(dplyr) 
#Useful for data wrangling
library(tidyr) 
# Useful for creating tidy tables
library(knitr) 
# useful for working with vectors and functions
library(purrr)
# useful to create insightful summaries of data set
library(skimr)
# useful to create insightful reports on data set
library(DataExplorer)
#ggplot2
library(ggplot2)
#forecast
library(forecast)
#time series
library(tseries)


# Week 4


# Visualize what age group submits the most reviews

qplot(ages, num_reviews, data = lego)


# Visualize what is the most expensive Lego
# purchased by customers who are 25 years or older

data_age25 <- lego[lego$ages>=25,]

qplot(list_price, data = data_age25, geom = "boxplot")





# Week 5


#view data

view(games_sales)

#summary of data

summary(games_sales)

#view/remove missing values from data set

sum(is.na (games_sales))

#convert genre column to lowercase

str_to_lower(games_sales$Genre)

#merge genre and platform columns

games_sales$Genre_Platform <- str_c (games_sales$Platform, games_sales$Genre, sep = " ")

games_sales <- subset (games_sales, select = -c(Genre, Platform))

#create plot to evaluate skewness of data 

ggplot(games_sales, aes(x = Global_Sales)) + geom_density()

# View type of Year column and convert to numeric


typeof(games_sales$Year)

games_sales$Year = as.numeric(games_sales$Year)

typeof(games_sales$Year)


#create correlation between x and y to help predict global sales !!!!!

ggplot(games_sales, aes(x = Year, y = Global_Sales)) +
  geom_point() + geom_smooth(method = "lm", se = FALSE)



# Week 6

#multiple linear regression model

#warning re-load data set

Lm_model = lm(Global_Sales ~ NA_Sales + EU_Sales, data= games_sales)

summary(Lm_model)

# This following line of code was seen on the student forum.
# Create new data frame for years for the three areas of sales
forecast <- data.frame(Global_Sales = 2021:2023, NA_Sales= 2021:2023,
                          EU_Sales = 2021:2023)

# I wrote this by myself
# predict sales for forecast period of 2021 to 2023
predict_games = predict(Lm_model, newdata = forecast, interval = 'confidence')
predict_games


