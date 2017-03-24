library(data.table)
file<-fread("household_power_consumption.txt",na.strings="?",stringsAsFactors = FALSE)
file1<-subset(file,Date=="1/2/2007" | Date=="2/2/2007",select=c(Date,Global_active_power))
file1<-file[file$Date %in% c("1/2/2007","2/2/2007"),]
png("plot1.png", width=480, height=480)
hist(as.numeric(file1$Global_active_power),col="red",main="Global active power",xlab="Global Active Power (kilowatts)")
dev.off()
