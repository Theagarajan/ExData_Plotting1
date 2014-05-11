##Importing Data from Working directory and marking the "?" as NA.
dataforplot <- read.csv("household_power_consumption.txt", sep =";", header=TRUE,na.strings=c("?"))

##Adding Time component to the time
dataforplot$Time <- paste(dataforplot$Date,dataforplot$Time,sep = " ")
dataforplot$Time <- strptime(dataforplot$Time,"%d/%m/%C%y %H:%M:%S")

##Converting Date column to Date class 
dataforplot$Date <- as.Date(dataforplot$Date,"%d/%m/%C%y")


##Subsetting the data for 2007-02-01 and 2007-02-01
feb1n2 <- dataforplot[dataforplot$Date == as.Date("2007-02-01") | dataforplot$Date == as.Date("2007-02-02"),]

png("Plot4.png",width =480, height =480)

par(mfcol=c(2,2))

plot(feb1n2$Time,feb1n2$Global_active_power,pch='.', type='o',xlab="Time",ylab="Global Active Power(kilowatts)")

plot(feb1n2$Time,feb1n2$Sub_metering_1,pch='.', type='n',xlab="Time",ylab="Energy Sub Metering")
points(feb1n2$Time,feb1n2$Sub_metering_1,pch='.',type='o', col="black")
points(feb1n2$Time,feb1n2$Sub_metering_2,pch='.',type='o', col="red")
points(feb1n2$Time,feb1n2$Sub_metering_3,pch='.',type='o', col="blue")
legend("topright", pch='-',col =c("black","red","blue"), legend = c("Sub metering 1","Sub metering 2","Sub metering 3"))

plot(feb1n2$Time,feb1n2$Voltage,pch='.',col="black", type='o',xlab="Time",ylab="Voltage")

plot(feb1n2$Time,feb1n2$Global_reactive_power,pch='.',col="black", type='o',xlab="Time",ylab="Global reactive power")

dev.off()