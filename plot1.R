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

## Constructing the plot 
hist(data$Global_active_power, col="orange red"
     , main="Global Active Power"
     , xlab="Global Active Power (kilowatts)")

## Creating a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", 480, 480)

## Closing the PNG file
dev.off()