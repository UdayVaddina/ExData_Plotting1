source("Master.R")
png("plot2.png", width=480, height=480)
plot(dayTimeData, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
