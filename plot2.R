library(data.table)
library(dplyr)

# Load and clean the data
power<-fread("household_power_consumption.txt")
power$Date<-as.Date(power$Date, "%d/%m/%Y")
power<- subset(power, Date>="2007-02-01" & Date <= "2007-02-02" )
power$Global_active_power<- as.numeric(power$Global_active_power)

power$comboDT<-as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

#  Open png file
png("plot2.png", width = 480, height = 480)

# Create the plot
plot(power$Global_active_power~power$comboDT, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Close the file
dev.off()
