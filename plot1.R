setwd("D:/My Documents/Coursera Data Science/exploratory_data_analysis/wd") #set the working directory
library(data.table)
library(dplyr)
file <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")  
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S") 
subsetted <- subset(file, Time >= as.POSIXlt("2007-02-01 00:00:00") & Time < as.POSIXlt('2007-02-03 00:00:00')) 
plot1 <- hist(subsetted$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")



png(file = "plot1.png")
with(subsetted, hist(subsetted$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()