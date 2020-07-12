#Reading the power consumption data and forming a subset for the dates specified
powerConsumption <- read.table("household_power_consumption.txt",sep=";")
names(powerConsumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowerConsumption <- subset(powerConsumption,powerConsumption$Date=="1/2/2007" | powerConsumption$Date =="2/2/2007")

# Change the date and time variables
subpowerConsumption$Date <- as.Date(subpowerConsumption$Date, format="%d/%m/%Y")
subpowerConsumption$Time <- strptime(subpowerConsumption$Time, format="%H:%M:%S")
subpowerConsumption[1:1440,"Time"] <- format(subpowerConsumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowerConsumption[1441:2880,"Time"] <- format(subpowerConsumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plot the graph
plot(subpowerConsumption$Time,as.numeric(as.character(subpowerConsumption$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#Annotate
title(main="Global Active Power Vs Time")