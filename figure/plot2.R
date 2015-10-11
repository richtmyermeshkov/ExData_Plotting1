
power <- read.table("./data/household_power_consumption.txt", header=TRUE, 
                    sep=";", stringsAsFactors = FALSE)
p <- power[which(as.character(power$Date) == '1/2/2007' | as.character(power$Date) == '2/2/2007'),]
p$datetime <- as.POSIXct(paste(p$Date,p$Time), format= "%d/%m/%Y %H:%M:%S")

#  Plot Two

with(p,{
  png("plot2.png",width=480,height=480)
  plot(datetime, as.numeric(Global_active_power), type="l", xlab= "", ylab="Global Active Power (kilowatts)")
  dev.off()
})
