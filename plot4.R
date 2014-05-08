# Loading data,  reading just lines enough to get from the begining to the target two days

# REPLACE the datafile string to your data file
datafile = "cproject_1/household_power_consumption.txt"
epc = read.table(datafile, sep=";", dec= ".", header=TRUE ,
                 na.strings="?"
                 ,colClasses = c("character" , "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") 
                 ,nrows=69517
)

#subsetting

epc$Date = as.Date(strptime(epc$Date,"%d/%m/%Y"))
twoDaysData = subset(epc, Date=="2007-02-01" |  Date=="2007-02-02")
# no further need of epc
rm(epc)

####### plot 4

twoDaysData$dateTime = paste(twoDaysData$Date, twoDaysData$Time)
twoDaysData$dateTime= strptime(twoDaysData$dateTime,"%Y-%m-%d %H:%M:%S")
Sys.setlocale(category = "LC_ALL", locale = "C")

png("plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))


# subplot 1.1
plot( twoDaysData$dateTime, twoDaysData$Global_active_power,  type="l", xlab="",  ylab="Global Active Power")

# subplot 1.2
plot( twoDaysData$dateTime, twoDaysData$Voltage,  type="l", xlab="datetime" ,  ylab="Voltage")

# subplot 2.1
plot( twoDaysData$dateTime, twoDaysData$Sub_metering_1,  type="l", xlab="",  ylab="Energy sub metering")
lines(twoDaysData$dateTime, twoDaysData$Sub_metering_2,  type="l", col="red")
lines(twoDaysData$dateTime, twoDaysData$Sub_metering_3,  type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1) ,col=c("black","red", "blue"), bty="n")

# subplot 2.2

plot( twoDaysData$dateTime, twoDaysData$Global_reactive_power,  type="l", xlab="datetime" ,  ylab="Global_Reactive_Power")

dev.off()
