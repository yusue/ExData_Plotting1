setwd("/Users/yusue/Downloads/")
mydata = read.csv("household_power_consumption 2.txt",nrows = 2075259, header = T, 
                  sep=';', na.strings="?", check.names=F, stringsAsFactors=F, 
                  comment.char="", quote='\"')

selectdata = subset(mydata, Date %in% c("1/2/2007","2/2/2007"))

selectdata$Date <- as.Date(selectdata$Date,format = "%d/%m/%Y" ) 
datetime <- paste(as.Date(selectdata$Date), selectdata$Time)
selectdata$datetime <- as.POSIXct(datetime)

png("plot3.png", width=480, height=480)
with(selectdata,{
  plot(Sub_metering_1~datetime, type="l",
                     col= "black",
                     ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~datetime,
         col= "red")
  lines(Sub_metering_3~datetime,
         col= "blue")
})  
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
