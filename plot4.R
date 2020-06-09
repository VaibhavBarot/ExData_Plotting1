#For reading only 2 days in Feb
csv<-read.table("consumption.txt",sep=";",skip=66637,nrow=2880,stringsAsFactors=FALSE)
#Getting headers by reading only first line
colnames(csv)<-unlist(strsplit(readLines("consumption.txt",n=1),";"))
date_time<-strptime(paste(csv$Date,csv$Time),format="%d/%m/%Y %H:%M:%S")

#Setting the size of graphic device to accomodate all plots
windows(height = 7, width = 7.5)
par(mfrow=c(2,2))

#First Plot
plot(date_time,csv[,3],pch=NA_integer_,xlab="",ylab="Global Active Power (Kilowatts)")
lines(date_time,csv[,3])

#Second plot
plot(date_time,csv[,5],pch=NA,xlab="datetime",ylab="Voltage")
lines(date_time,csv[,5])

#Third plot

	#First sub_meter
	plot(date_time,csv[,7],pch=NA,ylab="Energy sub metering",xlab="")
	lines(date_time,csv[,7])

	#Second sub_meter
	points(date_time,csv[,8],pch=NA)
	lines(date_time,csv[,8],col=2)

	#Third sub_meter
	points(date_time,csv[,9],pch=NA)
	lines(date_time,csv[,9],col=4)

	#Plotting legend altogether,also adding box lty =0 
	legend("topright",lty=1,col=c(1,2,4),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lty=0)

#Fourth plot
plot(date_time,csv[,4],pch=NA,xlab="datetime",ylab="Global_reactive_power")
lines(date_time,csv[,4])

dev.copy(png,"plot4.png")
dev.off()