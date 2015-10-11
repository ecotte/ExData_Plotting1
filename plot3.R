#Plot 3, creates a line plot of the Sub meterings

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

#Convert sub metering columns to Double
x$Sub_metering_1<-as.double(x$Sub_metering_1);
x$Sub_metering_2<-as.double(x$Sub_metering_2);
x$Sub_metering_3<-as.double(x$Sub_metering_3);

#Open PNG Graphic Device
png("plot3.png");

#Creates a line plot of the Sub meterings
plot(x$Sub_metering_1,type = "n",xaxt = "n",xlab = "",ylab = "Energy sub metering");
lines(x$Sub_metering_1)
lines(x$Sub_metering_2,col = "red")
lines(x$Sub_metering_3,col = "blue")
axis(1,at = 1, labels = "Thu")
axis(1,at = nrow(x), labels = "Fri");
axis(1,at = nrow(x)/2, labels = "Sat");
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1)

#Close Graphic Device
dev.off()
