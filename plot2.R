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

# Plot 2
plot(subset_elec_pwr_data$Global_active_power~subset_elec_pwr_data$Datetime,type="l",ylab="Global Active Power (kilowatts)"
    ,xlab= " " )
