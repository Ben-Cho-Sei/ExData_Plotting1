# read table
dCom <- read.table("household_power_consumption.txt", sep =";", head = TRUE)

# convert dates
dCom$Date <- as.Date(dCom$Date, format="%d/%m/%Y")

# subsetting
dComSub <- subset(dCom, dCom$Date >= "2007-02-01" & dCom$Date <= "2007-02-02")

# adding date-time column 
dComSub$DateTime <- as.POSIXct(paste(dComSub$Date, dComSub$Time), format="%Y-%m-%d %H:%M:%S") 

# conversions 
dComSub$Sub_metering_1  <- as.numeric(as.character(dComSub$Sub_metering_1))
dComSub$Sub_metering_2  <- as.numeric(as.character(dComSub$Sub_metering_2))
dComSub$Sub_metering_3  <- as.numeric(as.character(dComSub$Sub_metering_3))
dComSub$Voltage <- as.numeric(as.character(dComSub$Voltage))
dComSub$Global_active_power <- as.numeric(as.character(dComSub$Global_active_power))
dComSub$Global_reactive_power <- as.numeric(as.character(dComSub$Global_reactive_power))

# Split screen and text size
par (mfrow= c(2,2))

# Plot [1,1] - Global active power
plot (dComSub$DateTime, dComSub$Global_active_power, xlab = "" , ylab = "Global Active Power", type = "n")
lines(dComSub$DateTime, dComSub$Global_active_power)


# Plot [1,2] - Voltage
plot (dComSub$DateTime, dComSub$Voltage, xlab = "datetime" , ylab = "Voltage", type = "n")
lines(dComSub$DateTime, dComSub$Voltage)

# Plot [2,1] - Sub-metering
plot (dComSub$DateTime, dComSub$Global_active_power, xlab = "" , ylab = "Energy sub metering", type = "n", ylim = c(0,40))

lines(dComSub$DateTime, dComSub$Sub_metering_1)
lines(dComSub$DateTime, dComSub$Sub_metering_2, col = "red")
lines(dComSub$DateTime, dComSub$Sub_metering_3, col = "blue")

legend("topright", pch = "", lty = c(1, 1, 1) , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), y.intersp = 0.4, cex = 0.5, bty="n")

# Plot [2,2] - Global reactive power
plot (dComSub$DateTime, dComSub$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(dComSub$DateTime, dComSub$Global_reactive_power)


# copy to file
dev.copy(png, "plot4.png")
dev.off()
