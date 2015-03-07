## Script for reading in the data file household_power_consumption.txt and
## for producing a time series plot of Energy Sub Metering

library(data.table)
Sys.setlocale("LC_TIME", "en_US.UTF-8")


## Function for reading the data file household_power_consumption.txt
## into a data.table and extracts the right data related to dates 
## 1.-2.2.2007. The data file and the script file should be put into the 
## working directory

read_process <- function() {
    ## Read into data.table
    dt <- fread(input="household_power_consumption.txt", sep=";", 
                header=TRUE, na.strings='?', colClasses="character")
    
    ## Extract dates 1. - 2.2.2007
    dt[Date == "1/2/2007" | Date == "2/2/2007"]
}


## Function for drawing the plot and saving it into png-format

draw_plot <- function() {
    ## Read the data for 1.-2.2.2007
    dataset <- read_process()
    
    ## Extract Energy Sub Metering
    SubMet1 <- as.numeric(dataset[, Sub_metering_1])
    SubMet2 <- as.numeric(dataset[, Sub_metering_2])
    SubMet3 <- as.numeric(dataset[, Sub_metering_3])
    
    ## Extract dates and times
    dates <- dataset[, Date]
    times <- dataset[, Time]
    
    ## Form R variable containing the dates and times
    datetimes <- paste(dates, times)
    datetimes <- strptime(datetimes, "%d/%m/%Y %H:%M:%S")
    
    ## Save into png-file
    png(filename="plot3.png")
    
    ## Draw the time series plot
    plot(datetimes, SubMet1, type="l", xlab="", 
         ylab="Energy sub metering")
    lines(datetimes, SubMet2, col="red")
    lines(datetimes, SubMet3, col="blue")
    legend("topright", lty=1, col=c("black", "red", "blue"), cex=0.95,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.off()
}

draw_plot()

rm(draw_plot, read_process)