plot1 <- function(){
	library(datasets)
	filein <- "household_power_consumption.txt"
	date1 <- "1/2/2007"
	date2 <- "2/2/2007"
	dt <- read.csv(filein, header=TRUE, sep=";")
	x <- dt[dt$Date == date1 | dt$Date == date2,]
	gap <- as.numeric(as.character(x$Global_active_power))
	png(filename="plot1.png", width = 480, height = 480)
	hist(as.numeric(gap), breaks = 12, main = "Global Active Power",
		xlab = "Global Active Power (kilowatts)", col = "red")
	dev.off()
}