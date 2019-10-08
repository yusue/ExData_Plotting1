setwd("/Users/yusue/Downloads/")
mydata = read.csv("household_power_consumption 2.txt",nrows = 2075259, header = T, 
                  sep=';', na.strings="?", check.names=F, stringsAsFactors=F, 
                  comment.char="", quote='\"')

selectdata = subset(mydata, Date %in% c("1/2/2007","2/2/2007"))

selectdata$Date <- as.Date(selectdata$Date,format = "%d/%m/%Y" ) 
datetime <- paste(as.Date(selectdata$Date), selectdata$Time)
selectdata$datetime <- as.POSIXct(datetime)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(selectdata,{
    plot(Global_active_power~datetime, type="l",
         ylab="Global Active Power", xlab="")
    plot(Voltage~datetime, type="l",
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~datetime, type="l",
         col= "black",
         ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2~datetime,col= "red")
    lines(Sub_metering_3~datetime,col= "blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~datetime, type="l",
         ylab="Global_reactive_power", xlab="datetime")
})  

dev.off()