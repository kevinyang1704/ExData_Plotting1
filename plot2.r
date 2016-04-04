#Read File and clean data
power <- read.csv("household_power_consumption.txt", sep=";")
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power<- subset(power,Date >= "2007-02-01" & Date <= "2007-02-02")
power$Date1 <- strptime(paste(power$Date,power$Time),format="%Y-%m-%d %H:%M:%S")
power$Global_intensity <- as.numeric(as.character(power$Global_active_power))
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
power$Global_reactive_power <- as.numeric(as.character(power$Global_reactive_power))
power$Voltage <- as.numeric(as.character(power$Voltage))
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))

##Create plot on screen device
par(mfrow=c(1,1))
with(power,plot(Date1,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

#copy plot to PNG file
dev.copy(png, file="plot2.png")

#close PNG device
dev.off()

