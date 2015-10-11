library(data.table);
file_source = "Data/household_power_consumption.txt";
x<-fread(file_source,header = TRUE,colClasses = "character")
x$Date<-as.Date(x$Date,"%d/%m/%Y");
x<-x[x$Date==as.Date("2007-02-02")|x$Date==as.Date("2007-02-01")];
x$Global_active_power<-as.double(x$Global_active_power);
png("plot2.png");
plot(x$Global_active_power,type = "n",xaxt = "n",xlab = "",ylab = "Global Active Power (kilowatts)");
lines(x$Global_active_power);
axis(1,at = 1, labels = "Thu")
axis(1,at = nrow(x), labels = "Fri");
axis(1,at = nrow(x)/2, labels = "Sat");
dev.off()
