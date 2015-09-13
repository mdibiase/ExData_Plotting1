##Assuming the unziped data is in your working directory...
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), 
                   header=TRUE, sep = ";")
##For some reason the column names don't load right so:
colnames(data) <- c("Date", "Time", "Global_active_power", 
                    "Global_reative_power", "Voltage", 
                    "Global_intensity", "Sub_metering_1", 
                    "Sub_metering_2", "Sub_metering_3")
##Creates PNG file
png(filename = "plot1.png")
##Creates Histogram
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()