#Reading the power consumption data and forming a subset for the dates specified
powerConsumption <- read.table("household_power_consumption.txt",sep=";")
names(powerConsumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowerConsumption <- subset(powerConsumption,powerConsumption$Date=="1/2/2007" | powerConsumption$Date =="2/2/2007")

#use the base plot function
hist(as.numeric(as.character(subpowerConsumption$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotate
title(main="Global Active Power")
