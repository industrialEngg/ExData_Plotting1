fs<-list.files(getwd())

mydata<-read.table("household_power_consumption.txt",sep=";" ,header=TRUE, colClasses="character")   ## using colClasses, enable faster load for large data sets
mydata2<-subset(mydata, mydata[,1]=="1/2/2007" | mydata[,1]=="2/2/2007") ## subsetting the data for selecting only the two required days 

active_power<-as.numeric(mydata2[,3]) ## select 3rd column -"Global Active Power", and convert it to numeric for plotting purposes

hist(active_power, col=2, xlab="G lobal Active Power (kilowatts)", ylab="Frequency", main="Global Active Power") ## fill color set to red(2)

## histogram created using data extracted

dev.copy(png, "plot1.png", height=480, width=480)
dev.off()