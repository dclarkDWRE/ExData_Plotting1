## Import and Format data from txt file

housepowerdata <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",
nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

## Reformat the Date column
housepowerdata$Date <- as.Date(housepowerdata$Date, format="%d/%m/%Y")

## Subset date data between 2007/2/1 and 2007/2/2

powerdata <- subset(housepowerdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(housepowerdata)

## Convert Date Class

datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)

## Plot chart combining multiple graphs 

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerdata, {
plot(Global_active_power~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

plot(Voltage~Datetime, type="l",ylab="Voltage (volt)", xlab="")

plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Global_reactive_power~Datetime, type="l",ylab="Global Rective Power (kilowatts)",xlab="")
})

## Save Plot as PNG

dev.copy(png, file="plot4.png", height=500, width=500)
dev.off()