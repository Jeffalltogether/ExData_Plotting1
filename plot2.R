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

data <- data.frame(Times, EPC$Global_active_power)

## Plot 2
plot(data, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", main = "Global Active Power")
