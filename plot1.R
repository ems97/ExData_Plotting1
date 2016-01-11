#Get needed data
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
power$Date <- strptime(power$Date,"%d/%m/%Y")
powersub <- subset(power,power$Date=="2007-02-01"|power$Date=="2007-02-02")

#Transfrom needed variables into usable format
powersub$Global_active_power <- as.character(powersub$Global_active_power)
powersub$Global_active_power <- as.numeric(powersub$Global_active_power)

#Make plot
png(filename="plot1.png")
hist(powersub$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
