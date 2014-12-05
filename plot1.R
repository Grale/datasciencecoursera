ep<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

eps<-subset(ep,Date %in% c("1/2/2007","2/2/2007"))

x<-as.numeric(as.character(eps$Global_active_power))

png(file ="plot1.png") 

hist(x,xlab="Global Active Power(kilowatts)", main="Global Active Power",col=2)

dev.off()