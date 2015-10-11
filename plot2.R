#Plot 2, creates a line plot of the Global Active Power

#Load the data.table. Must have the Library installed, if not run install.packages("data.table")
library(data.table);

#File Location
file_source = "Data/household_power_consumption.txt";

#Read the file with fread, use character as the column classes for faster load.
x<-fread(file_source,header = TRUE,colClasses = "character");

#Convert Date column to Date class
x$Date<-as.Date(x$Date,"%d/%m/%Y");

#Filter data to use only february 01 and 02 of 2007
x<-x[x$Date==as.Date("2007-02-02")|x$Date==as.Date("2007-02-01")];

#Convert Global_active_power column to Double
x$Global_active_power<-as.double(x$Global_active_power);

#Open PNG Graphic Device
png("plot2.png");

#Create a line plot of the Global_active_power
plot(x$Global_active_power,type = "n",xaxt = "n",xlab = "",ylab = "Global Active Power (kilowatts)");
lines(x$Global_active_power);
axis(1,at = 1, labels = "Thu")
axis(1,at = nrow(x), labels = "Fri");
axis(1,at = nrow(x)/2, labels = "Sat");

#Close Graphic Device
dev.off()
