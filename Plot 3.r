## Import and Format data from txt file

housepowerdata <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",
nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

## Reformat the Date column
housepowerdata$Date <- as.Date(housepowerdata$Date, format="%d/%m/%Y")

## Subset date data between 2007/2/1 and 2007/2/2

powerdata <- subset(housepowerdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Convert Date Class

datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)

## Plot chart with legend 

with(powerdata, {
plot(Sub_metering_1~Datetime, type="l",
ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save Plot as PNG

dev.copy(png, file="plot3.png", height=500, width=500)
dev.off()