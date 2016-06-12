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

####################################Plot 1###################################
# open device
if(!file.exists('Plots')) dir.create('Plots')
png(filename = './Plots/p1.png', width = 480, height = 480, units='px')
# Create plot 1
with(data2, hist(as.numeric(data2$Global_active_power), xlab = 'Global Active Power (kwatt)', main = 'Global Active Power Distribution', col = 'red'))
# close device
dev.off()



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


####################################Plot 3###################################
# open device
if(!file.exists('Plots')) dir.create('Plots')
png(filename = './Plots/p3.png', width = 480, height = 480, units='px')
# Create plot 3
plot(data2$DateTime, data2$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data2$DateTime, data2$Sub_metering_2, col = 'red')
lines(data2$DateTime, data2$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
# close device
dev.off()



####################################Plot 4###################################
# open device
if(!file.exists('Plots')) dir.create('Plots')
png(filename = './Plots/p4.png', width = 480, height = 480, units='px')
# Create plot 4 (combined plots)
par(mfrow = c(2, 2))
plot(data2$DateTime, data2$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(data2$DateTime, data2$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(data2$DateTime, data2$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data2$DateTime, data2$Sub_metering_2, col = 'red')
lines(data2$DateTime, data2$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(data2$DateTime, data2$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
# close device
dev.off()