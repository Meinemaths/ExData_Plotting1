#set the right working directory
setwd("C:/Users/corin/Desktop/coursera/course4/week1")

#read in the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#select only the dates 1/2/20070 and 2/2/2007
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#make the right classes for the dataset
data$date_time <- paste0(data$Date, " " , data$Time)
data$date_time <- as.POSIXlt(as.character(data$date_time), format = "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))


# set language to English
Sys.setlocale("LC_ALL", "English")

#opens the device to make the png
dev.cur()
png(file = "plot3.png")


# make plot3
plot(data$date_time, data$Sub_metering_1, type ="l", xlab = " ", ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_2, type ="l", col = "red", xlab = " ", ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_3, type ="l", col = "blue", xlab = " ", ylab = "Energy sub metering")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2,2,2), col=c("black","red", "blue"))

# copy and close the device
dev.set(which = 2)
dev.copy(which = 3)
dev.off()