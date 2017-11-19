#setwd()
library("data.table")
data <- fread("C:\\Users\\User\\Documents\\R Coursera\\household_power_consumption.txt", header = TRUE)
data <- subset(data, (Date == "1/2/2007") | (Date == "2/2/2007")) #subsetting the data
data$Date <- as.POSIXct(strptime(data$Date, "%d/%m/%Y")) 
data$Time <- as.POSIXct(strptime(data$Time, "%H:%M:%S")) #classifying date and time

data$Global_active_power <- as.numeric(data$Global_active_power) #changing class of active power from character to numeric

png(filename = "plot1.png", width = 480, height = 480) #opening png
hist(data$Global_active_power, freq = TRUE, col = "orange", ylim = c(0, 1200), xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()

