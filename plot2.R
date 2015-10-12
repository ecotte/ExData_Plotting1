#Plot 2, creates a line plot of the Global Active Power

#Load the data.table. Must have the Library installed, if not run install.packages("data.table")
library(data.table);

#File Location
file_source = "Data/household_power_consumption.txt";

#Read the file with fread, use character as the column classes for faster load.
x<-fread(file_source,header = TRUE,colClasses = "character");

#Filter data to use only february 01 and 02 of 2007
x<-x[x$Date=="1/2/2007"|x$Date=="2/2/2007"];

#Convert Date column to Date class
x$Date<-as.Date(x$Date,"%d/%m/%Y");

#Create DateTime column
x$DateTime <- as.POSIXct(paste(as.Date(x$Date),x$Time))

#Convert Global_active_power column to Double
x$Global_active_power<-as.double(x$Global_active_power);

#Open PNG Graphic Device
png("plot2.png");

#Create a line plot of the Global_active_power
plot(x$DateTime,x$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)");

#Close Graphic Device
dev.off()
