#Read the data file with data for 2 days
datafile <- "./data/1_2_feb2007data.txt"

#Store the data in memory
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

#Join Date and Time column and store it as new column(Datetime)
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Initialize the plot parameters, filename, width and height
png(file = "plot2.png", bg = "transparent", width = 480, height = 480)

#Draw the graph
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Close the graphics device
dev.off()