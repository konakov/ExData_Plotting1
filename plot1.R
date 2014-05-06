###########################################################################
## Mission: Load the data and drow plot1 (histogram on Global active power)
###########################################################################

## For fast loadind, first get the col classes, and then load the data.
## Data file name is "household_power_consumption.txt"
data_5rows <- read.table("household_power_consumption.txt", sep=";", header=T, nrow=5, na.strings = "?", stringsAsFactors=FALSE)
classes <- sapply(data_5rows, class)
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=classes, na.strings = "?", stringsAsFactors=FALSE)

## convert the fist column to data for convience
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## the project requires only data for 2007-02-01 and 2007-02-02
data <- subset(data, Date == as.Date("01/02/2007", "%d/%m/%Y") | Date == as.Date("02/02/2007", "%d/%m/%Y"))

## plot the plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

print("Plot 1 finished to plot1.png")