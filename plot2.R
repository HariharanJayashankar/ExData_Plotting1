#setwd()
library("data.table")
data <- fread("C:\\Users\\User\\Documents\\R Coursera\\household_power_consumption.txt", header = TRUE)
data <- subset(data, (Date == "1/2/2007") | (Date == "2/2/2007")) #subsetting the data

data_whole <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sum(is.na(date_whole))


#no NAs. So the date and time are fine.
data$Global_active_power <- as.numeric(data$Global_active_power) #changing class of active power from character to numeric
sum(is.na(data$Global_active_power)) #no NA's. We can go ahead
data$day <- as.factor(weekdays(data$Date)) #getting weekdays as factors (weekdays( converts it into character))

png(filename = "plot2.png", width = 480, height = 480) #opening png
plot(data_whole, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
