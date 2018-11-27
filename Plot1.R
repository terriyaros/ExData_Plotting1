## Load data file

mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
mydata <- subset(mydata,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
mydata <- mydata[complete.cases(t),]

## Combine Date and Time column
dateTime <- paste(mydata$Date, mydata$Time)

## Name the vector
datetime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
data <- data[ ,!(names(t) %in% c("Date","Time"))]

## Add DateTime column
data <- cbind(dateTime, data)

## Format dateTime Column
data$dateTime <- as.POSIXct(dateTime)

## Plots the graph
hist(mydata$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
