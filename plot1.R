# plot1
setwd("/Users/yusue/Downloads/")
mydata = read.csv("household_power_consumption 2.txt",nrows = 2075259, header = T, 
                  sep=';', na.strings="?", check.names=F, stringsAsFactors=F, 
                  comment.char="", quote='\"')

selectdata = subset(mydata, Date %in% c("1/2/2007","2/2/2007"))

selectdata$Date <- as.Date(selectdata$Date,format = "%d/%m/%y" ) 
hist(selectdata$Global_active_power,breaks = 12,col = "red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

png("plot1.png", width=480, height=480)
dev.off()
