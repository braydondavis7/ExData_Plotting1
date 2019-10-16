rm(list=ls())

library(dplyr)

#Load data into R
elec_pwr_data <- read.table("/Users/braydondavis/Downloads/household_power_consumption.txt",header=T,na.strings = "?",sep=";")

#Change to date column
elec_pwr_data$Date <- as.Date(elec_pwr_data$Date,"%d/%m/%Y")

#Subset data on the two dates for plotting
subset_elec_pwr_data <- elec_pwr_data %>% filter(Date == "2007-02-01"|Date == "2007-02-02")

str(subset_elec_pwr_data)

# Plot 1
hist(subset_elec_pwr_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

