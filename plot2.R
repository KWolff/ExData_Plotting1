## Read in the data
## Pre-filter down to only what is needed to load
library(sqldf)
fileLocation <- "D:/Users/TheWolff/Documents/Coursera/Exploratory Data Analysis/household_power_consumption.txt"
sqlQuery <-  "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
powerData <- read.csv.sql(fileLocation, sql=sqlQuery, header = TRUE, sep=";")

## Convert first two columns from char to date and time
DateTime <- strptime(paste(powerData[,1],powerData[,2],sep=" "),format="%d/%m/%Y %H:%M:%S")
powerData2 <- cbind(DateTime,powerData[,-(1:2)])


png(file="D:/Users/TheWolff/Git/ExData_Plotting1/plot2.png")
with(powerData2, {plot(DateTime,Global_active_power,
                       type="n",
                       xlab="",
                       ylab="Global Active Power (kilowatts)")
                  lines(DateTime,Global_active_power)
})
dev.off()



