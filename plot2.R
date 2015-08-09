## Getting full dataset
full_data <- read.table("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

## Subsetting the data
my_data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
datetime <- paste(as.Date(my_data$Date), my_data$Time)
my_data$Datetime <- as.POSIXct(datetime)

# plot 2
plot(my_data$Global_active_power~my_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
