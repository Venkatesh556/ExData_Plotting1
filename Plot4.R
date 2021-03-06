library(data.table)
file<-fread("household_power_consumption.txt",na.strings="?",stringsAsFactors = FALSE)
file1<-subset(file,Date=="1/2/2007" | Date=="2/2/2007",select=c(Date,Global_active_power))
file1<-file[file$Date %in% c("1/2/2007","2/2/2007"),]
t<-strptime(paste(file1$Date, file1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(t,as.numeric(file1$Global_active_power),xlab="",ylab="Global Active Power (kilowatts)",type="l")
plot(t,file1$Sub_metering_1,xlab="",ylab="Energy Sub meeting",type="l")
lines(t,file1$Sub_metering_2,type="l",col="red")
lines(t,file1$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(t,file1$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(t,file1$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
