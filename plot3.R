library(data.table)
library(dplyr)

# Load and clean the data
power<-fread("household_power_consumption.txt")
power$Date<-as.Date(power$Date, "%d/%m/%Y")
power<- subset(power, Date>="2007-02-01" & Date <= "2007-02-02" )
power$Global_active_power<- as.numeric(power$Global_active_power)

power$comboDT<-as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

#  Open png file
png("plot3.png", width = 480, height = 480)

# Create the plot
plot(power$Sub_metering_1 ~ power$comboDT, type="l", ylab="Energy sub metering", xlab="")
lines(power$Sub_metering_2 ~ power$comboDT, col= "red")
lines(power$Sub_metering_3 ~ power$comboDT, col= "blue")

legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black", "red", "blue"), lty="solid")

# Close the file
dev.off()
