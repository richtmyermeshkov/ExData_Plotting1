
power <- read.table("./data/household_power_consumption.txt", header=TRUE, 
                    sep=";", stringsAsFactors = FALSE)
p <- power[which(as.character(power$Date) == '1/2/2007' | as.character(power$Date) == '2/2/2007'),]
p$datetime <- as.POSIXct(paste(p$Date,p$Time), format= "%d/%m/%Y %H:%M:%S")

#  Plot Three
with(p,{
  png("plot3.png",width=480,height=480)
  par()
  plot(datetime, Sub_metering_1,type="l", xlab= "", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=1, col=c('black','red', 'blue'))
  dev.off()
})

