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

## Create plot 

plot(powerdata$Global_active_power~powerdata$Datetime, type="l",
ylab="Global Active Power (kilowatts)", xlab="")

## Save Plot as PNG
dev.copy(png, file="plot2.png", height=500, width=500)
dev.off()