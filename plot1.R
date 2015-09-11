## Exploratory Data Analysis Project 1
## This R file read a Dataset and then, creates a Plot 
## Reading Data
mtable<- data.table(read.table("household_power_consumption.txt",header = TRUE,stringsAsFactors = FALSE,sep=";",na.strings = "?",nrows = 2075259))
## Converting Character to Date Class
mtable[,"Date"]<- as.Date(mtable$Date,"%d/%m/%Y")
## Selecting Desired rows
day1<-mtable[mtable$Date=="2007-02-01",]
day2<-mtable[mtable$Date=="2007-02-02",]
## Building a new Table
fin<-rbind(day1,day2)
## Drwawing the Plot
wd<-getwd()
png(filename = paste(wd,"/plot1.png",sep=""))
hist(fin$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red")
dev.off()

