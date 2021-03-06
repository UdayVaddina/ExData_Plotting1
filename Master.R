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
#str(twoDaysData)

dayTimeTmp <- paste(twoDaysData$Date, twoDaysData$Time, sep = " ")
#class(dayTimeTmp)

dayTimeData <- strptime(dayTimeTmp, "%d/%m/%Y %H:%M:%S")
#class(dayTimeData)

globalActivePower <- as.numeric(twoDaysData$Global_active_power)
globalReactivePower <- as.numeric(twoDaysData$Global_reactive_power)
voltage <- as.numeric(twoDaysData$Voltage)

subMetering1 <- as.numeric(twoDaysData$Sub_metering_1)
subMetering2 <- as.numeric(twoDaysData$Sub_metering_2)
subMetering3 <- as.numeric(twoDaysData$Sub_metering_3)