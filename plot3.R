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
png(filename = "plot3.png")
##Plots it...
plot(data$date.time, data$Sub_metering_1, type="l", col=1,
     ylab = "Energy sub metering",
     xlab = NA)
lines(data$date.time, data$Sub_metering_2, col=2)
lines(data$date.time, data$Sub_metering_3, col=4)
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2",
                  "Sub_metering_3"), lty = 1)
dev.off()