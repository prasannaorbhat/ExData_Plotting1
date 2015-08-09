## Getting full dataset
full_data <- read.table("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

## Subsetting the data
my_data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
datetime <- paste(as.Date(my_data$Date), my_data$Time)
my_data$Datetime <- as.POSIXct(datetime)

# plot 3
with(my_data, {
  plot(my_data$Sub_metering_1~my_data$Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(my_data$Sub_metering_2~my_data$Datetime, col='Red')
  lines(my_data$Sub_metering_3~my_data$Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# save file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
