## Set working directory
setwd(
  "C:/Users/db15928/Downloads/R practise/Coursera/Data Exploration - week 4/exdata_data_household_power_consumption"
)

## Filter data based on Date Columns while reading
data_full <-
  read.csv(
    "household_power_consumption.txt",
    header = T,
    sep = ';',
    na.strings = "?",
    nrows = 2075259,
    check.names = F,
    stringsAsFactors = F,
    comment.char = "",
    quote = '\"'
  )
data1 <- subset(data_full, Date %in% c("1/2/2007", "2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Plot 2
with(data1, {
  plot(
    Global_active_power ~ Datetime,
    type = "l",
    ylab = "Global Active Power (kilowatts)",
    xlab = ""
  )
})

## Save plot2 in png file
dev.copy(png, 'plot2.png', width = 480, height = 480)
dev.off()
