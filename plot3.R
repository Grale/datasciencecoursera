ep<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

eps<-subset(ep,Date %in% c("1/2/2007","2/2/2007"))

eps$Date<-as.Date(eps$Date,"%d/%m/%Y")

Date_Time<-paste(as.character(eps$Date),as.character(eps$Time))

eps$Date_Time<-strptime(Date_Time, format="%Y-%m-%d %H:%M:%S")

s1<-as.numeric(as.character(eps$Sub_metering_1))
s2<-as.numeric(as.character(eps$Sub_metering_2))
s3=eps$Sub_metering_3

png(file ="plot3.png") 

plot(x=eps$Date_Time,y=s1,xlab="", ylab="Energy sub metering",pch=NA_integer_)
lines(x=eps$Date_Time,y=s1)
lines(x=eps$Date_Time,y=s2,col="red")
lines(x=eps$Date_Time,y=s3,col="blue")

legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()