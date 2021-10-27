library(data.table)
library(dplyr)

# Load and clean the data
power<-fread("household_power_consumption.txt")
power$Date<-as.Date(power$Date, "%d/%m/%Y")
str(power)
power<- subset(power, Date>="2007-02-01" & Date <= "2007-02-02" )
power$Global_active_power<- as.numeric(power$Global_active_power)


#  Open png file
png("plot1.png", width = 480, height = 480)

# Create the plot
hist(power$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

# Close the file
dev.off()
