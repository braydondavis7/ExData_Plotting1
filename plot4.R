rm(list=ls())
library(dplyr)

#Load data into R
elec_pwr_data <- read.table("/Users/braydondavis/Downloads/household_power_consumption.txt",header=T,na.strings = "?",sep=";")

#Change to date column
elec_pwr_data$Date <- as.Date(elec_pwr_data$Date,"%d/%m/%Y")

#Subset data on the two dates for plotting
subset_elec_pwr_data <- elec_pwr_data %>% filter(Date == "2007-02-01"|Date == "2007-02-02")

#Combine data and time
datetime <- paste(as.Date(subset_elec_pwr_data$Date), subset_elec_pwr_data$Time)
subset_elec_pwr_data$Datetime <- as.POSIXct(datetime)

# Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(subset_elec_pwr_data$Global_active_power~subset_elec_pwr_data$Datetime,type="l",ylab="Global Active Power (kilowatts)"
     ,xlab= " " )

plot(subset_elec_pwr_data$Voltage~subset_elec_pwr_data$Datetime,type="l",ylab="Voltage (volt)"
     ,xlab= " " )

plot(subset_elec_pwr_data$Sub_metering_1~subset_elec_pwr_data$Datetime,type="l",ylab="Global Active Power (kilowatts)"
     ,xlab= "" )
lines(subset_elec_pwr_data$Sub_metering_2~subset_elec_pwr_data$Datetime,col="red")
lines(subset_elec_pwr_data$Sub_metering_3~subset_elec_pwr_data$Datetime,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subset_elec_pwr_data$Global_reactive_power~subset_elec_pwr_data$Datetime,type="l",ylab="Global Reactive Power (kilowatts)"
     ,xlab= " " )



