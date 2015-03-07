## Script for reading in the data file household_power_consumption.txt and
## for producing a histogram of Global Active Power

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
    
    ## Extract Global Active Power
    Gap <- as.numeric(dataset[, Global_active_power])

    ## Save into png-file
    png(filename="plot1.png")
    
    ## Draw the histogram
    hist(Gap, col="red", xlab="Global Active Power (kilowatts)",
         main="Global Active Power")
    
    dev.off()
}

draw_plot()

rm(draw_plot, read_process)