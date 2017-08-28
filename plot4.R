# Plot 4 for combined plots

# Load data only from 2007-02-01 to 2007-02-02
setwd("C:/Users/Irina/Dropbox/Coursera/Exploratory Data Analysis/Week1")
file <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value=TRUE), sep = ";", header = TRUE, na.strings = "?")
colnames <- read.table(file, nrows = 1, sep = ";")
colnames(data) <- as.matrix(colnames)

# Combine the date with the time
tmpDate <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(tmpDate, data$Time))

# Create main plot
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
# Top left
plot(data$DateTime, data$Global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power")
lines(data$DateTime, data$Global_active_power)
# Top right
plot(data$DateTime, data$Voltage, type = "n",
     xlab = "datetime", ylab = "Voltage")
lines(data$DateTime, data$Voltage)
# Bottom left
plot(data$DateTime, data$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lwd = 1)
# Bottom right
plot(data$DateTime, data$Global_reactive_power, type = "n",
     xlab = "datetime", ylab = "Global_reactive_power")
lines(data$DateTime, data$Global_reactive_power)
dev.off()