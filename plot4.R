## Reading Data
mtable<-read.table("household_power_consumption.txt",skip=grep(c("1/2/2007"),readLines("household_power_consumption.txt")),nrows=2880,sep=";",header = TRUE,stringsAsFactors = FALSE)
colnames(mtable)<-columns
## Converting Character to Date Class
mdate<-paste(mtable$Date,mtable$Time,sep=" ")
mdate<-strptime(mdate,format = "%d/%m/%Y %H:%M:%S")
## Building a new Table
mtable<-cbind(mtable,mdate)
## Drwawing the Plot
wd<-getwd()
png(filename = paste(wd,"/plot4.png",sep=""))
par(mfrow=c(2,2))
plot(mtable$mdate,mtable$Global_active_power,type ="n",ylab = "Global Active Power (kilowatts)",xlab = "")
lines(mtable$mdate,mtable$Global_active_power)
plot(mtable$mdate,mtable$Voltage,type ="n",ylab = "Voltage",xlab = "")
lines(mtable$mdate,mtable$Voltage)
plot(mtable$mdate,mtable$Sub_metering_1,type="n",ylab = "Energy sub metering",xlab = "")
lines(mtable$mdate ,mtable$Sub_metering_1,col = "black")
lines(mtable$mdate ,mtable$Sub_metering_2,col = "red")
lines(mtable$mdate ,mtable$Sub_metering_3,col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("black","red","blue"))
plot(mtable$mdate,mtable$Global_reactive_power,type ="n",ylab = "Global_reactive_power",xlab = "")
lines(mtable$mdate,mtable$Global_reactive_power)
dev.off()