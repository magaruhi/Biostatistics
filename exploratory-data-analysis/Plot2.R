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

## plot "Plot 2" and save the .PNG
png("plot2.png", width=480, height=480)
with(twodayperiod, plot(dateANDtime, Global_active_power, 
                        ylab="Global Active Power (kilowatts)",
                        xlab="Day",
                        type="l", 
                        ))
dev.off()

## END

################################################################################
