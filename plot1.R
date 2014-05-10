## Read in the data
## Pre-filter down to only what is needed to load
library(sqldf)
fileLocation <- "D:/Users/TheWolff/Documents/Coursera/Exploratory Data Analysis/household_power_consumption.txt"
sqlQuery <-  "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
powerData <- read.csv.sql(fileLocation, sql=sqlQuery, header = TRUE, sep=";")

png(file="D:/Users/TheWolff/Git/ExData_Plotting1/plot1.png")
hist(powerData$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
