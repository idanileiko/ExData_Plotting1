# Plot 1 for Frequency of Global Active Power

# Load data only from 2007-02-01 to 2007-02-02
setwd("C:/Users/Irina/Dropbox/Coursera/Exploratory Data Analysis/Week1")
file <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value=TRUE), sep = ";", header = TRUE, na.strings = "?")
colnames <- read.table(file, nrows = 1, sep = ";")
colnames(data) <- as.matrix(colnames)

# Create plot
png("plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power")
dev.off()
