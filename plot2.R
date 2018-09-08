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

# set language to English
Sys.setlocale("LC_ALL", "English")

#opens the device to make the png
dev.cur()
png(file = "plot2.png")

# make plot2
plot(data$date_time, data$Global_active_power, type ="l", xlab = " ", ylab = "Global Active Power (kilowatts)")

# copy and close the device
dev.set(which = 2)
dev.copy(which = 3)
dev.off()
