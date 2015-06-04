mydata<-read.table("household_power_consumption.txt",sep=";" ,header=TRUE, colClasses="character")   ## using colClasses, enable faster load for large data sets
mydata2<-subset(mydata, mydata[,1]=="1/2/2007" | mydata[,1]=="2/2/2007") ## subsetting the data for selecting only the two required days 



dt<-mydata2[,1] ## extract date as a separate vector
tm<-mydata2[,2] ## extract time as a separate vector
dattime<-paste(dt, tm, sep=" ")  ## combine to form a single field (string) containing date and time
mydatetime<-strptime(dattime, "%d/%m/%Y %H:%M:%S")  ## strptime takes the string (date & time combined as character) and converts it to time datatime format which can be used by R


active_power<-as.numeric(mydata2[,3]) ## select 3rd column -"Global Active Power", and convert it to numeric for plotting purposes
volt<-as.numeric(mydata2[,5])  ## extract voltage field and convert it to numeric field
reactive_power<-as.numeric(mydata2[,4])  ## extract reactive_power field and convert it to numeric field

sub1<-as.numeric(mydata2[,7])
sub2<-as.numeric(mydata2[,8])
sub3<-as.numeric(mydata2[,9])




old.par<-par(mfrow=c(2,2))

plot(x=mydatetime, y=active_power, type="l",ylab="Global Active Power(kilowatt)" ,xlab="")  ## Sub-Plot 1 --> Global Active Power
plot(x=mydatetime, y=volt, ylab="Voltage", xlab="datetime", type="l") ## Sub-Plot #2 --> voltage

##plot(x=mydatetime, y=active_power, type="l",ylab="Global Active Power(kilowatt)" ,xlab="")  ## Sub-Plot 3 --> sub metering
par(new=F)

plot(x=mydatetime, y=sub1, ylab='Enery sub Metering', type="l",xlab="")
par(new=T)
lines(x=mydatetime, y=sub2, col=2,xlab="")
par(new=T)
lines(x=mydatetime, y=sub3, col="blue",xlab="")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red","blue"))
par(new=F)


plot(x=mydatetime, y=reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l") ## Sub-Plot #2 --> reactive power

par(old.par)


dev.copy(png, "plot4.png", height=480, width=480)
dev.off()

