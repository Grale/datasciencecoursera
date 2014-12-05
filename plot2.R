ep<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

eps<-subset(ep,Date %in% c("1/2/2007","2/2/2007"))

eps$Date<-as.Date(eps$Date,"%d/%m/%Y")

Date_Time<-paste(as.character(eps$Date),as.character(eps$Time))

eps$Date_Time<-strptime(Date_Time, format="%Y-%m-%d %H:%M:%S")

y1<-as.numeric(as.character(eps$Global_active_power))

png(file ="plot2.png") 

with(eps,plot(x=Date_Time,y=y1,xlab="", ylab="Global Active Power (kilowatts)",pch=NA_integer_))
with(eps,lines(x=Date_Time,y=y1))

dev.off()