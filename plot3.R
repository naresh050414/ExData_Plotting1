# load complete data set into R
fulldata<-read.table("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = FALSE,na.strings = "?")
fulldata$Date<-as.Date(fulldata$Date, format="%d/%m/%Y")

# subset data as per specified timeframe
data_subset<-subset(fulldata,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#create date/time data
datetime<-paste(as.Date(data_subset$Date),data_subset$Time)
data_subset$datetime<-as.POSIXct(datetime)


with(data_subset,{
  plot(Sub_metering_1~datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  })

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
