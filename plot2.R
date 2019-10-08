setwd("/Users/yusue/Downloads/")
mydata = read.csv("household_power_consumption 2.txt",nrows = 2075259, header = T, 
                  sep=';', na.strings="?", check.names=F, stringsAsFactors=F, 
                  comment.char="", quote='\"')

selectdata = subset(mydata, Date %in% c("1/2/2007","2/2/2007"))

selectdata$Date <- as.Date(selectdata$Date,format = "%d/%m/%Y" ) 
datetime <- paste(as.Date(selectdata$Date), selectdata$Time)
selectdata$datetime <- as.POSIXct(datetime)

with(selectdata, {
    plot(Global_active_power~datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
})
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()