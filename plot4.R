#Read the data file with data for 2 days
datafile <- "./data/1_2_feb2007data.txt"

#Store the data in memory
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

#Join Date and Time column and store it as new column(Datetime)
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Initialize the plot parameters, filename, width and height
png(file = "plot4.png", bg = "transparent", width = 480, height = 480)

#Draw the plots, first create a table with 2 rows and 2 cols for the 4 plots
par(mfrow = c(2, 2))

# plot 1 (NW)
plot(data$Datetime, data$Global_active_power, type = "l", 
	ylab = "Global Active Power", 
    xlab = "")

# plot 2 (NE)
plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 3 (SW)
plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
    xlab = "", col = "black")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
    col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
    col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"), bty = "n", )

# plot 4 (SE)
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", 
    ylab = "Global_reactive_power", ylim = c(0, 0.5))

#Close the graphics device
dev.off()