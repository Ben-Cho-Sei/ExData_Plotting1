# read table
dCom <- read.table("household_power_consumption.txt", sep =";", head = TRUE)

# convert dates
dCom$Date <- as.Date(dCom$Date, format="%d/%m/%Y")

# subsetting
dComSub <- subset(dCom, dCom$Date >= "2007-02-01" & dCom$Date <= "2007-02-02")

# adding date-time column 
dComSub$DateTime <- as.POSIXct(paste(dComSub$Date, dComSub$Time), format="%Y-%m-%d %H:%M:%S") 

# convert Global active power
dComSub$Global_active_power <- as.numeric(as.character(dComSub$Global_active_power))

# plot empty canvas
plot (dComSub$DateTime, dComSub$Global_active_power, xlab = "" , ylab = "Global Active Power (kilowatts)", type = "n")
lines(dComSub$DateTime, dComSub$Global_active_power)

# copy to file
dev.copy(png, "plot2.png")
dev.off()
