#For reading only 2 days in Feb
csv<-read.table("consumption.txt",sep=";",skip=66637,nrow=2880)
#Getting headers by reading only first line
colnames(csv)<-unlist(strsplit(readLines("consumption.txt",n=1),";"))

#Keeping main and x label empty so we can use title function
hist<-hist(csv$Global_active_power,col=2,main="",xlab="")
title("Global Active Power")
title(xlab="Global Active Power (kilowatts)")

#Saving as png
dev.copy(png,"plot1.png")
dev.off()