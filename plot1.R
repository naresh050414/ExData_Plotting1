# load complete data set into R
fulldata<-read.table("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = FALSE,na.strings = "?")
fulldata$Date<-as.Date(fulldata$Date, format="%d/%m/%Y")


# subset data as per specified timeframe
data_subset<-subset(fulldata,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#create date/time data
datetime<-paste(as.Date(data_subset$Date),data_subset$Time)
data_subset$datetime<-as.POSIXct(datetime)


hist(data_subset$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)",ylab = "Frequency", col="red")

#save graph onto png file
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()



