## Read in the data
## Pre-filter down to only what is needed to load
library(sqldf)
fileLocation <- "D:/Users/TheWolff/Documents/Coursera/Exploratory Data Analysis/household_power_consumption.txt"
sqlQuery <-  "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
powerData <- read.csv.sql(fileLocation, sql=sqlQuery, header = TRUE, sep=";")

## Convert first two columns from char to date and time
DateTime <- strptime(paste(powerData[,1],powerData[,2],sep=" "),format="%d/%m/%Y %H:%M:%S")
powerData2 <- cbind(DateTime,powerData[,-(1:2)])


png(file="D:/Users/TheWolff/Git/ExData_Plotting1/plot4.png")
# Set up a 2x2 plotting window
par(mfrow=c(2,2))

# Upper left
with(powerData2, {plot(DateTime,Global_active_power,
                       type="n",
                       xlab="",
                       ylab="Global Active Power (kilowatts)")
                  lines(DateTime,Global_active_power)
})


# Upper right
with(powerData2, {plot(DateTime,Voltage,
                       type="n",
                       xlab="datetime",
                       ylab="Voltage")
                  lines(DateTime,Voltage)
})

# Lower left
with(powerData2, {plot(DateTime,Sub_metering_1,
                       type="n",
                       xlab="",
                       ylab="Energy sub metering")
                  lines(DateTime,Sub_metering_1)
                  lines(DateTime,Sub_metering_2, col="red")
                  lines(DateTime,Sub_metering_3, col="blue")
                  legend("topright",lty="solid", col = c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_3","Sub_metering_3"))
})

# Lower right
with(powerData2, {plot(DateTime,Global_reactive_power,
                       type="n",
                       xlab="datetime",
                       ylab="Global_reactive_power")
                  lines(DateTime,Global_reactive_power)
})
dev.off()



