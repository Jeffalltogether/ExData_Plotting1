## Exploratory Data Analysis Assignment 1
library(dplyr)

## Working Directory
setwd(C:/Users/jeffthatcher/Cloud Drive/RRepos/ExData_Plotting1)

##Load the dates from 2007-02-01 to 2007-02-02
header <- read.table("C:/Users/jeffthatcher/Cloud Drive/RRepos/ExploreData_Data/household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
EPC <- read.table("C:/Users/jeffthatcher/Cloud Drive/RRepos/ExploreData_Data/household_power_consumption.txt", skip = 60000, nrows = 20000, sep = ";", header = FALSE)
colnames(EPC) <- unlist(header)

# Change Date and Time columns into a date + time column
EPC$Date <- as.Date(EPC$Date, '%d/%m/%Y')    #format dates as character class

# Subset data to desired date range
EPC <- filter(EPC, Date >= '2007-02-01')
EPC <- filter(EPC, Date <= '2007-02-02')
range(EPC$Date)

## Plot 1
hist(as.numeric(EPC$Global_active_power)/1000, breaks = 15, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

## Copy plot to PNG
dev.copy(png, file = "plot1.png")
dev.off()
