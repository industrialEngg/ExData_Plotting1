

mydata<-read.table("household_power_consumption.txt",sep=";" ,header=TRUE, colClasses="character")   ## using colClasses, enable faster load for large data sets
mydata2<-subset(mydata, mydata[,1]=="1/2/2007" | mydata[,1]=="2/2/2007") ## subsetting the data for selecting only the two required days 

active_power<-as.numeric(mydata2[,3]) ## select 3rd column -"Global Active Power", and convert it to numeric for plotting purposes

dt<-mydata2[,1] ## extract date as a separate vector
tm<-mydata2[,2] ## extract time as a separate vector

dattime<-paste(dt, tm, sep=" ")  ## combine to form a single field (string) containing date and time

mydatetime<-strptime(dattime, "%d/%m/%Y %H:%M:%S")  ## strptime takes the string (date & time combined as character) and converts it to time datatime format which can be used by R


plot(x=mydatetime, y=active_power, type="l",ylab="Global Active Power(kilowatt)" )


dev.copy(png, "plot2.png", height=480, width=480)

dev.off()