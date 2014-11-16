#Read the data file with data for 2 days
datafile <- "./data/1_2_feb2007data.txt"

#Store the data in memory
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

#Debug statement
#head(data, 10)

#Join Date and Time column and store it as new column(Datetime)
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Debug statement
#head(data, 10)

#Initialize the plot parameters, filename, width and height
png(file = "plot1.png", bg = "transparent", width = 480, height = 480)

#Draw the histogram
hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 1200), xlim = c(0, 6), xaxp = c(0, 6, 3))

#Close the graphics device
dev.off()