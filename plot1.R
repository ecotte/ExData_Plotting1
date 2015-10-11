library(data.table);
file_source = "Data/household_power_consumption.txt";
x<-fread(file_source,header = TRUE,colClasses = "character")
x$Date<-as.Date(x$Date,"%d/%m/%Y");
x<-x[x$Date==as.Date("2007-02-02")|x$Date==as.Date("2007-02-01")];
x$Global_active_power<-as.double(x$Global_active_power);
png("plot1.png");
hist(x$Global_active_power,main = "Global Active Power",col = "red",xlab = "Global Active Power (kilowatts)");
dev.off()
