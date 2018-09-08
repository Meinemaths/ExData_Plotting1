#set the right working directory
setwd("C:/Users/corin/Desktop/coursera/course4/week1")

#read in the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#select only the dates 1/2/20070 and 2/2/2007
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#make the right classes for the dataset
data$date_time <- paste0(data$Date, " " , data$Time)
data$date_time <- as.POSIXlt(as.character(data$date_time), format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))


# set language to English
Sys.setlocale("LC_ALL", "English")

#opens the device to make the png
dev.cur()
png(file = "plot4.png")

#make the frame for the plots
par(mfrow = c(2, 2))

# make plot 1
plot(data$date_time, data$Global_active_power, type ="l", xlab = " ", ylab = "Global Active Power (kilowatts)")

# make plot 2
plot(data$date_time, data$Voltage, type ="l", xlab = "datetime", ylab = "Voltage")


# make plot3
plot(data$date_time, data$Sub_metering_1, type ="l", xlab = " ", ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_2, type ="l", col = "red", xlab = " ", ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_3, type ="l", col = "blue", xlab = " ", ylab = "Energy sub metering")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2,2,2), col=c("black","red", "blue"), box.lty = 0)
box(lty = 1)

# make plot 4
plot(data$date_time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# copy and close the device
dev.set(which = 2)
dev.copy(which = 3)
dev.off()