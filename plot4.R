setwd("D:/My Documents/Coursera Data Science/exploratory_data_analysis/wd") #set the working directory
library(data.table)
library(dplyr)
file <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")  
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S") 
subsetted <- subset(file, Time >= as.POSIXlt("2007-02-01 00:00:00") & Time < as.POSIXlt('2007-02-03 00:00:00')) 

png(file="plot4.png")
par(mfrow = c(2,2))
plot(subsetted$Time, subsetted$Global_active_power, xlab = " ", ylab = "Global Active Power", pch=19, type = "l", lwd = 1)
plot(subsetted$Time, subsetted$Voltage, xlab = "datetime", ylab = "Voltage", pch=19, type = "l", lwd = 1)
with(subsetted, {with(subsetted, plot(subsetted$Time, subsetted$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
  with(subsetted, points(subsetted$Time, subsetted$Sub_metering_1, type = "l"))
  with(subsetted, points(subsetted$Time, subsetted$Sub_metering_2, type = "l", col = "red"))
  with(subsetted, points(subsetted$Time, subsetted$Sub_metering_3, type = "l", col = "blue"))
  legend("topright", lty = c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
plot(subsetted$Time, subsetted$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", pch = 19, type = "l", lwd=1)
dev.off()

