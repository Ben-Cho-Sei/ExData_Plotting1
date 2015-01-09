# read table
dCom <- read.table("household_power_consumption.txt", sep =";", head = TRUE)

# convert dates
dCom$Date <- as.Date(dCom$Date, format="%d/%m/%Y")

# subsetting
dComSub <- subset(dCom, dCom$Date >= "2007-02-01" & dCom$Date <= "2007-02-02")

# adding date-time column 
dComSub$DateTime <- as.POSIXct(paste(dComSub$Date, dComSub$Time), format="%Y-%m-%d %H:%M:%S") 

# convert Sub-meterings 1 and  2
dComSub$Sub_metering_1  <- as.numeric(as.character(dComSub$Sub_metering_1))
dComSub$Sub_metering_2  <- as.numeric(as.character(dComSub$Sub_metering_2))
dComSub$Sub_metering_3  <- as.numeric(as.character(dComSub$Sub_metering_3))

# plot empty canvas
plot (dComSub$DateTime, dComSub$Global_active_power, xlab = "" , ylab = "Energy sub metering", type = "n", ylim = c(0,40))

#draw lines and legend
lines(dComSub$DateTime, dComSub$Sub_metering_1)
lines(dComSub$DateTime, dComSub$Sub_metering_2, col = "red")
lines(dComSub$DateTime, dComSub$Sub_metering_3, col = "blue")

legend("topright", pch = "", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# copy to file
dev.copy(png, "plot3.png")
dev.off()
