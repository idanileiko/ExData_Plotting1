# Plot 2 for Global Active Power per Day

# Load data only from 2007-02-01 to 2007-02-02
setwd("C:/Users/Irina/Dropbox/Coursera/Exploratory Data Analysis/Week1")
file <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value=TRUE), sep = ";", header = TRUE, na.strings = "?")
colnames <- read.table(file, nrows = 1, sep = ";")
colnames(data) <- as.matrix(colnames)

# Combine the date with the time
tmpDate <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(tmpDate, data$Time))

# Create plot
png("plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)
dev.off()
