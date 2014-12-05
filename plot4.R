ep<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

eps<-subset(ep,Date %in% c("1/2/2007","2/2/2007"))

eps$Date<-as.Date(eps$Date,"%d/%m/%Y")

Date_Time<-paste(as.character(eps$Date),as.character(eps$Time))

eps$Date_Time<-strptime(Date_Time, format="%Y-%m-%d %H:%M:%S")

eps$Voltage<-as.numeric(as.character(eps$Voltage))

eps$Global_reactive_power<-as.numeric(as.character(eps$Global_reactive_power))

s1<-as.numeric(as.character(eps$Sub_metering_1))
s2<-as.numeric(as.character(eps$Sub_metering_2))
s3=eps$Sub_metering_3

y1<-as.numeric(as.character(eps$Global_active_power))

png(file ="plot4.png") 

par(mfrow = c( 2,2))

with(eps, {  

plot(x=Date_Time,y=y1,xlab="", ylab="Global Active Power",pch=NA_integer_)
lines(x=Date_Time,y=y1)

plot(y=Voltage,x=Date_Time,pch=".",xlab="datetime")
lines(y=Voltage,x=Date_Time)


plot(x=Date_Time,y=s1,xlab="", ylab="Energy sub metering",pch=NA_integer_)
lines(x=Date_Time,y=s1)
lines(x=Date_Time,y=s2,col="red")
lines(x=Date_Time,y=s3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(y=Global_reactive_power,x=Date_Time,pch=NA_integer_,xlab="datetime")
lines(y=Global_reactive_power,x=Date_Time)  })

dev.off()