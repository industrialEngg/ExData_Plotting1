mydata<-read.table("household_power_consumption.txt",sep=";" ,header=TRUE, colClasses="character")   ## using colClasses, enable faster load for large data sets
mydata2<-subset(mydata, mydata[,1]=="1/2/2007" | mydata[,1]=="2/2/2007") ## subsetting the data for selecting only the two required days 

sub1<-as.numeric(mydata2[,7])
sub2<-as.numeric(mydata2[,8])
sub3<-as.numeric(mydata2[,9])


plot(x=mydatetime, y=sub1, ylab='Enery sub Metering', type="l",xlab='')
par(new=T)
lines(x=mydatetime, y=sub2, col=2,xlab='')
par(new=T)
lines(x=mydatetime, y=sub3, col="blue",xlab='')
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red","blue"))
par(new=F)


dev.copy(png, "plot3.png", height=480, width=480)

dev.off()