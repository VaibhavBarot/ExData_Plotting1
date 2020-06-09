#For reading only 2 days in Feb
csv<-read.table("consumption.txt",sep=";",skip=66637,nrow=2880,stringsAsFactors=FALSE)
#Getting headers by reading only first line
colnames(csv)<-unlist(strsplit(readLines("consumption.txt",n=1),";"))

#Concatenating date and time variables
date_time<-strptime(paste(csv$Date,csv$Time),format="%d/%m/%Y %H:%M:%S")
#We dont want to plot points with any character type
plot(date_time,csv[,3],pch=NA_integer_,xlab="",ylab="Global Active Power (Kilowatts)")
lines(date_time,csv[,3])

dev.copy(png,"plot2.png")
dev.off()