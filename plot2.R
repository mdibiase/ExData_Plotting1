##Assuming the unziped data is in your working directory...
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), 
                   header=TRUE, sep = ";")
##For some reason the column names don't load right so:
colnames(data) <- c("Date", "Time", "Global_active_power", 
                    "Global_reative_power", "Voltage", 
                    "Global_intensity", "Sub_metering_1", 
                    "Sub_metering_2", "Sub_metering_3")
##Creates New Column "date.time" to convert to a date. 
data$date.time <- paste(data$Date, data$Time, sep=" ")
data$date.time <- strptime(data$date.time, format = "%d/%m/%Y %H:%M:%S")
##Creates PNG
png(filename = "plot2.png")
##Plots the graph, changing the Y label and removing the X label
plot(data$date.time, data$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = NA)
dev.off()