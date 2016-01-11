#Get needed data
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
power$Date <- strptime(power$Date,"%d/%m/%Y")
powersub <- subset(power,power$Date=="2007-02-01"|power$Date=="2007-02-02")

#Transfrom needed variables into usable format
powersub$Global_active_power <- as.character(powersub$Global_active_power)
powersub$Global_active_power <- as.numeric(powersub$Global_active_power)

#Put date in needed format
Sys.setlocale("LC_ALL","English")
library(lubridate)
powersub$datetime <- ymd_hms(paste(as.character(powersub$Date),powersub$Time,sep=" "))

#Make plot
png(filename="plot2.png")
plot(powersub$datetime,powersub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()