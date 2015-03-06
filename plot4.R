## Read the file and skip the first 66637 rows  and take nrows 2880 (2*24*60)
## Take 2-day period (1/2/2007 - 2/2/2007)  
data <- read.table("household_power_consumption.txt"
                   , sep=";"
                   , skip = 66637
                   , nrows = 2880
                   , col.names = colnames(read.table("household_power_consumption.txt"
                   , nrow = 1
                   , header = TRUE
                   ,sep   =";")))

## Creating a Date_Time column of Date/Time class by concatenation of Date and Time
data$Date_Time <- paste(data$Date, data$Time)
data$Date_Time <- strptime(data$Date_Time, format="%d/%m/%Y %H:%M:%S")

## Creating a PNG file with a width of 480 pixels and a height of 480 pixels
#dev.copy(png, file = "plot4.png", 480, 480)
png("plot4.png", 480, 480)

## Constructing the plot 
    
par(mfrow = c(2,2))
plot(data$Date_Time
     , data$Global_active_power
     , type = "l"
     , xlab = ""
     , ylab = "Global Active Power")


plot(data$Date_Time
     , data$Voltage
     , xlab = "datetime"
     , type = "l"
     , ylab = "Voltage")


plot(data$Date_Time
     , data$Sub_metering_1
     , type = "l"
     , xlab = ""
     , ylab = "Energy sub metering")
lines(data$Date_Time
      , data$Sub_metering_2
      , col = "red")
lines(data$Date_Time
      , data$Sub_metering_3
      , col = "blue")
legend("topright"
       ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,col    = c("black", "red", "blue")
       ,lty    = 1
       ,bty    = "n")


plot(data$Date_Time
     , data$Global_reactive_power
     , type = "l"
     , xlab = "datetime"
     , ylab = "Global_reactive_power")


## Closing the PNG file
dev.off()