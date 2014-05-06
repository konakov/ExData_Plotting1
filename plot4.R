###########################################################################
## Mission: Load the data and draw 4 plots
###########################################################################

## For fast loadind, first get the col classes, and then load the data.
## Data file name is "household_power_consumption.txt"
data_5rows <- read.table("household_power_consumption.txt", sep=";", header=T, nrow=5, na.strings = "?", stringsAsFactors=FALSE)
classes <- sapply(data_5rows, class)
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=classes, na.strings = "?", stringsAsFactors=FALSE)

## the project requires only data for 2007-02-01 and 2007-02-02
data <- subset(data, as.Date(data$Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(data$Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))

## convert the fist two columns in date time  to data for convience
data$date_time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Set locale to get "Thu Fri Sat" instead of Russian daynames
Sys.setlocale("LC_TIME", "C")

## plot the plots
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
par(mfrow=c(2, 2))

## 1st plot
plot(data$date_time, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

## 2nd plot
plot(data$date_time, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

## 3rd plot
plot(data$date_time, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$date_time, data$Sub_metering_2, col="red")
lines(data$date_time, data$Sub_metering_3, col="blue")

l_col = c("black", "red", "blue")
l_legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", col=l_col, legend=l_legend, pch="—", bty="n")

## 4th plot
plot(data$date_time, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()


print("Plot 4 finished to plot4.png")