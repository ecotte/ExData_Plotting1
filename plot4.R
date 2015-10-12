#Plot 3, creates a line plot of the Sub meterings

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


#Convert sub metering columns to Double
x$Sub_metering_1<-as.double(x$Sub_metering_1);
x$Sub_metering_2<-as.double(x$Sub_metering_2);
x$Sub_metering_3<-as.double(x$Sub_metering_3);

#Conver voltage column to double
x$Voltage <- as.double(x$Voltage);

#Conver Global_reactive_power to double
x$Global_reactive_power<-as.double(x$Global_reactive_power);

#Open PNG Graphic Device
png("plot4.png",width = 600,height = 600);

#Change Graphic device to have 4 plots, 2 in each row.
par(mfcol = c(2,2));

#Create a line plot of the Global_active_power
plot(x$DateTime,x$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)");

#Creates a line plot of the Sub meterings on position (2,1)
plot(x$DateTime,x$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering");
lines(x$DateTime,x$Sub_metering_1)
lines(x$DateTime,x$Sub_metering_2,col = "red")
lines(x$DateTime,x$Sub_metering_3,col = "blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1,bty = "n")

#Create a line plot for the voltage on position (1,2)
plot(x$DateTime,x$Voltage,type = "n",xlab = "datetime",ylab = "Voltage");
lines(x$DateTime,x$Voltage);

#Create a line plot of the Global_reactive_power on position (2,2)
plot(x$DateTime,x$Global_reactive_power,type = "n",xlab = "datetime",ylab = "Global_reactive_power");
lines(x$DateTime,x$Global_reactive_power);

#Close Graphic Device
dev.off()
