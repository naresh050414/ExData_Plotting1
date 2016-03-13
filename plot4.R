# load complete data set into R
fulldata<-read.table("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = FALSE,na.strings = "?")
fulldata$Date<-as.Date(fulldata$Date, format="%d/%m/%Y")

# subset data as per specified timeframe
data_subset<-subset(fulldata,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#create date/time data
datetime<-paste(as.Date(data_subset$Date),data_subset$Time)
data_subset$datetime<-as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_subset, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
