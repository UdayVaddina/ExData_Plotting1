source("Master.R")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# plot (1,1) 
plot(dayTimeData, globalActivePower, 
     type = "l", xlab = "", ylab = "Global Active Power") 

# plot (1,2) 
plot(dayTimeData, voltage, 
     type = "l", ylab = "Voltage", xlab = "datetime") 

# plot (2,1) 
plot(dayTimeData, subMetering1,
     type = "l", ylab = "Energy sub metering", xlab = "", col = "black") 
lines(dayTimeData, subMetering2,
       type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
lines(dayTimeData, subMetering3, 
       type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue") 
legend("topright",  col = c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n" ) 

# plot (2,2) 
plot(dayTimeData, globalReactivePower, las=1,
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
