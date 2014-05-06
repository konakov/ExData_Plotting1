###########################################################################
## Mission: Load the data and drow plot3 (thee sub meterings by date and time)
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

## plot the plot3
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

plot(data$date_time, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$date_time, data$Sub_metering_2, col="red")
lines(data$date_time, data$Sub_metering_3, col="blue")

l_col = c("black", "red", "blue")
l_legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", col=l_col, legend=l_legend, pch="—")

dev.off()



print("Plot 3 finished to plot3.png")