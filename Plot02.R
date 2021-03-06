power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsetDataSet <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

subsetDataSet$Date <- as.Date(subsetDataSet$Date, format="%d/%m/%Y")
subsetDataSet$Time <- strptime(subsetDataSet$Time, format="%H:%M:%S")

subsetDataSet[1:1440,"Time"] <- format(subsetDataSet[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetDataSet[1441:2880,"Time"] <- format(subsetDataSet[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subsetDataSet$Time,as.numeric(as.character(subsetDataSet$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
