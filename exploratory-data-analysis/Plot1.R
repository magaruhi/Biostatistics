################################################################################

## Read data
data <- read.table(sep=";","./household_power_consumption.txt", header = TRUE,
                   stringsAsFactors = FALSE)

## change data to correct class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power) 

## Subset the first two days in February, 2007
twodayperiod <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## plot "Plot 1" (Histogram of Global Active Power) and save it in .PNG
png("plot1.png", width=480, height=480)
hist(twodayperiod$Global_active_power, 
     main ="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red", 
     border="black"
     )
dev.off()

## END

################################################################################
