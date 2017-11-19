#setwd()
library("data.table")
data <- fread("C:\\Users\\User\\Documents\\R Coursera\\household_power_consumption.txt", header = TRUE)
data <- subset(data, (Date == "1/2/2007") | (Date == "2/2/2007")) #subsetting the data

date_whole <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3) 
data$Voltage <- as.numeric(data$Voltage)#making all vars numeric

png(filename = "plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(date_whole, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(date_whole, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date_whole, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_whole, data$Sub_metering_2, type="l", col="red")
lines(date_whole, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2, col=c("black", "red", "blue"), bty="o")
plot(date_whole, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()