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

## Create Histgram plot 

hist(powerdata$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save Plot as PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()