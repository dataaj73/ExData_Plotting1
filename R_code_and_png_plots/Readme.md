## Information about the files contained in the directory

This directory contains the required png plots and the R codes that produce
them. The plot1.R produces the plot1.png and so on. The codes are run by 
simply typing in R the command

    source("plot1.R")

with similar command for the rest of the files.

The R codes contain two functions read_process and draw_plot. They take no 
input parameters. The read_process is the same in every R file. The draw_plot
is dependent on the plot being drawn, so this function is different is every
R file.

The read_process reads in Individual Household Electric
Power Consumption Data Set that is available UCI Machine Learning Repository 
at the web-address

https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

The data has to be separately downloaded into the working directory and the R
code has to be in the same directory. After reading the data in as a 
data.table the read_process function extracts the data related to the days
2007-02-01 and 2007-02-02 and returns the information as a data.table.

The draw_plot uses the relevant parts of the data.table to draw the plots.
Necessary manipulations due to reading in are made, such as changing vectors
to numeric and forming datetime objects in R. In then the plot is made into
a png-device.