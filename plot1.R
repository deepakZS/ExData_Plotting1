##### Code to plot histogram for Global active Power ######

## Set working directory
setwd(
  "C:/Users/db15928/Downloads/R practise/Coursera/Data Exploration - week 4/exdata_data_household_power_consumption"
)

## Add essential packages in session
library(sqldf)
library(lubridate)

## Filter data based on Date Columns while reading
df <-
  read.csv.sql(
    "household_power_consumption.txt",
    "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
    sep = ";"
  )

## Convert Character to date
df$Date <- dmy(df$Date)

## Plot Histogram for Global active Power
hist(
  df$Global_active_power,
  col = "red",
  xlab = "Global Active Power (Kilowatts)",
  main = "Global Active Power"
)

## Save histogram in png file
dev.copy(png, 'plot1.png', width = 480, height = 480)
dev.off()
