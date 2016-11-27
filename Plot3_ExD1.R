source("Master.R")
png("plot3.png", width=480, height=480)

plot(dayTimeData, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dayTimeData, subMetering2, type = "l", col = "red")
lines(dayTimeData, subMetering3, type = "l", col = "blue")

legend("topright", 
       c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), 
       lty=1, lwd=2.5, 
       col = c("black", "red", "blue"))

dev.off()
