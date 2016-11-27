rm(list = ls(all = TRUE))

# Download the dataset
fileurl='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if (!file.exists('./data/household_power_consumption.zip')){
  dir.create("./data")
  download.file(fileurl, './data/household_power_consumption.zip', mode = 'wb')
}

# unzip dataset into the folder data
data_file= unzip(zipfile="./data/household_power_consumption.zip",exdir="./data")

hPowCons <- read.table( data_file, header = TRUE, sep = ';', na.strings = '?', dec = "." )

twoDaysData <- hPowCons[hPowCons$Date %in% c("1/2/2007","2/2/2007") ,]
dayTimeData <- strptime(paste(twoDaysData$Date, twoDaysData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
#class(dayTimeData)

subMetering1 <- as.numeric(twoDaysData$Sub_metering_1)
subMetering2 <- as.numeric(twoDaysData$Sub_metering_2)
subMetering3 <- as.numeric(twoDaysData$Sub_metering_3)

globalActivePower <- as.numeric(twoDaysData$Global_active_power)
png("plot3.png", width=480, height=480)

hist(subMetering1, col="red", main="Global Active Power", xlab="Global")
plot(dayTimeData, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dayTimeData, subMetering2, type = "l", col = "red")
lines(dayTimeData, subMetering3, type = "l", col = "blue")

legend("topright", 
       c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), 
       lty=1, lwd=2.5, 
       col = c("black", "red", "blue"))


dev.off()
