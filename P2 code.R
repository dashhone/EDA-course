################################upload Project Data########################
setwd('C:/Users/toppa/Dropbox/01 ACEDEMIC/00 Data Science/Course 4 EDA/Week1')
if(!file.exists('Project')) dir.create('Project')
URL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(URL, destfile = './Project/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './Project')

datafile<-"./Project/household_power_consumption.txt"
data<-read.table(datafile,header=TRUE,sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##head(data,3)
#dim(data)
data2<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]
#dim(data2)

####################################Plot 2###################################
# date format
data2$Date <- as.Date(data2$Date, format = '%d/%m/%Y')
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time))
# open device
if(!file.exists('Plots')) dir.create('Plots')
png(filename = './Plots/p2.png', width = 480, height = 480, units='px')
# Create plot 2
plot(data2$DateTime, data2$Global_active_power, xlab = '', ylab = 'Global Active Power (kwatt)', type = 'l')
# close device
dev.off()