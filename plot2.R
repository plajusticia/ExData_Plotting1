## Exploratory Data Analysis Project 1
## This R file read a Dataset and then, creates a Plot2
columns<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
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
png(filename = paste(wd,"/plot2.png",sep=""))
plot(mtable$mdate,mtable$Global_active_power,type ="n",ylab = "Global Active Power (kilowatts)",xlab = "")
lines(mtable$mdate,mtable$Global_active_power)
dev.off()