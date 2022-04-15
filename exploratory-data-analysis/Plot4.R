################################################################################

## Read data
data <- read.table("./household_power_consumption.txt", 
                   stringsAsFactors = FALSE, 
                   header = TRUE, 
                   sep =";"  )

## Merge date and time
timeANDdate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, timeANDdate)

## change data to correct class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)

## Subset the first two days in February, 2007
twodayperiod <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## plot graphs and save the .PNG
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(twodayperiod, plot(timeANDdate, Global_active_power,
                        ylab="Global Active Power",
                        type="l",
                        xlab=""
                        ))
with(twodayperiod, plot(timeANDdate, Voltage,
                        ylab="Voltage",
                        type = "l",
                        xlab="datetime"
                        ))
with(twodayperiod, plot(timeANDdate, Sub_metering_1,
                        ylab="Energy sub metering",
                        type="l",
                        xlab=""
                        ))
lines(twodayperiod$timeANDdate, twodayperiod$Sub_metering_2,
      type="l",
      col= "red")
lines(twodayperiod$timeANDdate, twodayperiod$Sub_metering_3,
      type="l",
      col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty= 1,
       lwd=2,
       col = c("black", "red", "blue"))
with(twodayperiod, plot(timeANDdate, Global_reactive_power,
                        ylab="Global_reactive_power",
                        type="l",
                        xlab="datetime"
                        ))
dev.off()

## END

################################################################################
