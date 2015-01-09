
# load data
dCom <- read.table("household_power_consumption.txt", sep =";", head = TRUE)

# format date and time 
dCom$Date <- as.Date(dCom$Date, format="%d/%m/%Y")
dCom$Time <- strptime(dCom$Time ,"%H:%M:%S")

# subsetting
dComSub <- subset(dCom, dCom$Date >= "2007-02-01" & dCom$Date <= "2007-02-02")
dComSub$Global_active_power <- as.numeric(as.character(dComSub$Global_active_power))

# create histogram
hist (dComSub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", ylim=c(0,1200))

# copy to pgn
dev.copy(png, "plot1.png")
dev.off()
