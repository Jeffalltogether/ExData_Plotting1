## Exploratory Data Analysis Assignment 1
library(dplyr)

#Load the dates from 2007-02-01 to 2007-02-02
header <- read.table("C:/Users/jeffthatcher/Cloud Drive/RRepos/ExploreData_Data/household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
EPC <- read.table("C:/Users/jeffthatcher/Cloud Drive/RRepos/ExploreData_Data/household_power_consumption.txt", skip = 60000, nrows = 20000, sep = ";", header = FALSE)
colnames(EPC) <- unlist(header)

## Change Date and Time columns into a date + time column
EPC$Date <- as.Date(EPC$Date, '%d/%m/%Y')    #format dates as character class

## Subset data to desired date range
EPC <- filter(EPC, Date >= '2007-02-01')
EPC <- filter(EPC, Date <= '2007-02-02')

range(EPC$Date)

## Combine Date and Time
Times <- paste(EPC$Date,EPC$Time)  #combine data and time into one variabel
Times <- strptime(Times, '%Y-%m-%d %H:%M:%S')   #format data and time 

data <- data.frame(Times, as.numeric(EPC$Global_active_power), 
                   as.numeric(EPC$Sub_metering_1), 
                   as.numeric(EPC$Sub_metering_2), 
                   as.numeric(EPC$Sub_metering_3),
                   as.numeric(EPC$Voltage),
                   as.numeric(EPC$Global_reactive_power)
                   )
names <- c("Time", "Global_active_power", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "Voltage", "Global_reactive_power")
colnames(data) <- names

## Plot 4
par(mfrow = c(2,2))
with(data, plot(Times, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

with(data, plot(Times, Voltage, type = "l", ylab = "Voltage", xlab = ""))

with(data, {
        plot(Times, Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "")
        lines(Times, Sub_metering_2, type = "l", col = "red")
        lines(Times, Sub_metering_3, type = "l", col = "blue")
})

with(data, plot(Times, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = ""))

