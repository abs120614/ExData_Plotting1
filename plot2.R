rm(list=ls())

#reading in the data
filename <- "/Users/abasu/Documents/ExData_Plotting1/household_power_consumption.txt"
df <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
head(df)

#putting date and time into the correct format to be able to use them for charting
df$date <- as.Date(df$Date, format = "%d/%m/%Y")
datetime <- paste(df$date, df$Time)
df$datetime <- as.POSIXct(datetime)

#creating plot 2
plot(df$Global_active_power ~ df$datetime, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

#creating the png file
png("plot2.png", width=480, height=480)
plot(df$Global_active_power ~ df$datetime, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()