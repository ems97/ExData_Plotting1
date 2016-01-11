#Get needed data
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
power$Date <- strptime(power$Date,"%d/%m/%Y")
powersub <- subset(power,power$Date=="2007-02-01"|power$Date=="2007-02-02")

#Put date in needed format
Sys.setlocale("LC_ALL","English")
library(lubridate)
powersub$datetime <- ymd_hms(paste(as.character(powersub$Date),powersub$Time,sep=" "))

#Transfrom needed variables into usable format
powersub$Sub_metering_1 <- as.character(powersub$Sub_metering_1)
powersub$Sub_metering_1 <- as.numeric(powersub$Sub_metering_1)
powersub$Sub_metering_2 <- as.character(powersub$Sub_metering_2)
powersub$Sub_metering_2 <- as.numeric(powersub$Sub_metering_2)

#Make plot
png(filename="plot3.png")
plot(powersub$datetime,powersub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(powersub$datetime,powersub$Sub_metering_2,type="l",col="red")
lines(powersub$datetime,powersub$Sub_metering_3,type="l",col="blue")
legend("topright",lwd=c(2.5,2.5,2.5),col=c("black","blue","red"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()