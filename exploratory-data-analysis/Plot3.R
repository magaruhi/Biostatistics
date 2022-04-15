################################################################################

## Read data
data <- read.table("./household_power_consumption.txt",
                   stringsAsFactors = FALSE, 
                   header = TRUE, 
                   sep =";"  )

## Merge date and time
dateANDtime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, dateANDtime)

## change data to correct classs
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

## Subset the first two days in February, 2007
twodayperiod <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## plot "Plot 3" and save the .PNG
png("plot3.png", width=480, height=480)
with(twodayperiod, plot(dateANDtime, Sub_metering_1, 
                        xlab="Day", 
                        ylab="Energy sub metering", 
                        type="l"))
lines(twodayperiod$dateANDtime, twodayperiod$Sub_metering_2,
      col= "red", 
      type="l")
lines(twodayperiod$dateANDtime, twodayperiod$Sub_metering_3,
      col= "blue"
      type="l")
legend(c("topright"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty= 1, 
       lwd=2,
       col = c("black", "red", "blue"))
dev.off()

## END

################################################################################
