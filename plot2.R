plot2 <- function(){
	library(datasets)
	filein <- "household_power_consumption.txt"
	date1 <- "1/2/2007"
	date2 <- "2/2/2007"
	dt <- read.csv(filein, header=TRUE, sep=";")
	x <- dt[dt$Date == date1 | dt$Date == date2,]
	gap <- as.numeric(as.character(x$Global_active_power))
	xaxisvalues = (0:2)*nrow(x)/2+1
	png(filename="plot2.png", width = 480, height = 480)
	plot(gap, type = "l", xaxt = "n", xlab = "",
		ylab = "Global Active Power (kilowatts)")
	axis(1, at = xaxisvalues , labels = c('Thu', 'Fri', 'Sat'))
	dev.off()
}