#Read the data file with data for 2 days
datafile <- "./data/1_2_feb2007data.txt"

#Store the data in memory
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

#Join Date and Time column and store it as new column(Datetime)
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Initialize the plot parameters, filename, width and height
png(file = "plot3.png", bg = "transparent", width = 480, height = 480)

#Draw the graph
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", 
	ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", 
	ylab = "Energy sub metering", col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", 
	ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close the graphics device
dev.off()