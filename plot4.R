library(data.table);
file_source = "Data/household_power_consumption.txt";
x<-fread(file_source,header = TRUE,colClasses = "character")
x$Date<-as.Date(x$Date,"%d/%m/%Y");
x<-x[x$Date==as.Date("2007-02-02")|x$Date==as.Date("2007-02-01")];
x$Global_active_power<-as.double(x$Global_active_power);
x$Sub_metering_1<-as.double(x$Sub_metering_1);
x$Sub_metering_2<-as.double(x$Sub_metering_2);
x$Sub_metering_3<-as.double(x$Sub_metering_3);
x$Voltage <- as.double(x$Voltage);
x$Global_reactive_power<-as.double(x$Global_reactive_power);
png("plot4.png",width = 800,height = 800);

par(mfcol = c(2,2));

plot(x$Global_active_power,type = "n",xaxt = "n",xlab = "",ylab = "Global Active Power (kilowatts)");
lines(x$Global_active_power);
axis(1,at = 1, labels = "Thu")
axis(1,at = nrow(x), labels = "Fri");
axis(1,at = nrow(x)/2, labels = "Sat");

plot(x$Sub_metering_1,type = "n",xaxt = "n",xlab = "",ylab = "Energy sub metering");
lines(x$Sub_metering_1)
lines(x$Sub_metering_2,col = "red")
lines(x$Sub_metering_3,col = "blue")
axis(1,at = 1, labels = "Thu")
axis(1,at = nrow(x), labels = "Fri");
axis(1,at = nrow(x)/2, labels = "Sat");
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1,bty = "n")

plot(x$Voltage,type = "n",xaxt = "n",xlab = "datetime",ylab = "Voltage");
lines(x$Voltage);
axis(1,at = 1, labels = "Thu")
axis(1,at = nrow(x), labels = "Fri");
axis(1,at = nrow(x)/2, labels = "Sat");

plot(x$Global_reactive_power,type = "n",xaxt = "n",xlab = "datetime",ylab = "Global_reactive_power");
lines(x$Global_reactive_power);
axis(1,at = 1, labels = "Thu")
axis(1,at = nrow(x), labels = "Fri");
axis(1,at = nrow(x)/2, labels = "Sat");

dev.off()
