plot4 <- function(){
	library(datasets)
	filein <- "household_power_consumption.txt"
	date1 <- "1/2/2007"
	date2 <- "2/2/2007"
	dt <- read.csv(filein, header=TRUE, sep=";")
	x <- dt[dt$Date == date1 | dt$Date == date2,]
	png(filename="plot4.png", width = 480, height = 480)
	par(mfcol=c(2,2))
	gap <- as.numeric(as.character(x$Global_active_power))
	xaxisvalues = (0:2)*nrow(x)/2+1
	plot(gap, type = "l", xaxt = "n", xlab = "",
		ylab = "Global Active Power (kilowatts)")
	axis(1, at = xaxisvalues , labels = c('Thu', 'Fri', 'Sat'))

	sm1 <- as.numeric(as.character(x$Sub_metering_1))
	sm2 <- as.numeric(as.character(x$Sub_metering_2))
	sm3 <- as.numeric(as.character(x$Sub_metering_3))
	xaxisvalues = (0:2)*nrow(x)/2+1
	plot(sm1, type = "l", xaxt = "n", xlab = "",
		ylab = "Energy sub metering")
	lines(sm2, type="l", col="red")
	lines(sm3, type="l", col="blue")
	axis(1, at = xaxisvalues , labels = c('Thu', 'Fri', 'Sat'))
	legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
		 cex = 0.8, col = c("black", "red", "blue"), lty = 1, bty = "n");

	voltage <- as.numeric(as.character(x$Voltage))
	xaxisvalues = (0:2)*nrow(x)/2+1
	plot(voltage , type = "l", xaxt = "n", xlab = "datetime",
		ylab = "Voltage")
	axis(1, at = xaxisvalues , labels = c('Thu', 'Fri', 'Sat'))

	grp<- as.numeric(as.character(x$Global_reactive_power))
	xaxisvalues = (0:2)*nrow(x)/2+1
	plot(grp, type = "l", xaxt = "n", xlab = "datetime",
		ylab = "Global_reactive_power")
	axis(1, at = xaxisvalues , labels = c('Thu', 'Fri', 'Sat'))
	dev.off()
}