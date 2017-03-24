library(data.table)
file<-fread("household_power_consumption.txt",na.strings="?",stringsAsFactors = FALSE)
file1<-subset(file,Date=="1/2/2007" | Date=="2/2/2007",select=c(Date,Global_active_power))
file1<-file[file$Date %in% c("1/2/2007","2/2/2007"),]
t<-strptime(paste(file1$Date, file1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(t,as.numeric(file1$Global_active_power),xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
