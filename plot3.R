rm(list=ls())

#reading in the data
filename <- "/Users/abasu/Documents/ExData_Plotting1/household_power_consumption.txt"
df <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
head(df)

#putting date and time into the correct format to be able to use them for charting
df$date <- as.Date(df$Date, format = "%d/%m/%Y")
datetime <- paste(df$date, df$Time)
df$datetime <- as.POSIXct(datetime)

#creating plot 3 with legend
with(df, {
  plot(df$Sub_metering_1 ~ df$datetime, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(df$Sub_metering_2 ~ df$datetime, col = 'Red')
  lines(df$Sub_metering_3 ~ df$datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#creating png file
png("plot3.png", width=480, height=480)
with(df, {
  plot(df$Sub_metering_1 ~ df$datetime, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(df$Sub_metering_2 ~ df$datetime, col = 'Red')
  lines(df$Sub_metering_3 ~ df$datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()