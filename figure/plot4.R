

power <- read.table("./data/household_power_consumption.txt", header=TRUE, 
                    sep=";", stringsAsFactors = FALSE)
p <- power[which(as.character(power$Date) == '1/2/2007' | as.character(power$Date) == '2/2/2007'),]
p$datetime <- as.POSIXct(paste(p$Date,p$Time), format= "%d/%m/%Y %H:%M:%S")

#  Plot Four

with(p,{
  png("plot4.png",width=480,height=480)
  par(mfrow=c(2,2))
  plot(datetime, Global_active_power, type="l", xlab= "", ylab="Global Active Power (kilowatts)")
  plot(datetime, Voltage, type="l", ylab="Voltage")
  plot(datetime, Sub_metering_1,type="l", xlab= "", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=1, bty="n", col=c('black','red', 'blue'))
  plot(datetime, Global_reactive_power, type="l")
  dev.off()
}
)
