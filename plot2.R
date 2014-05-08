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


####### plot 2

# pasting date and time to build the x-axis
twoDaysData$dateTime = paste(twoDaysData$Date, twoDaysData$Time)
twoDaysData$dateTime= strptime(twoDaysData$dateTime,"%Y-%m-%d %H:%M:%S")

# setting the default locale (POSIX locale) to avoid custom settings interfering with the output
Sys.setlocale(category = "LC_ALL", locale = "C")

png("plot2.png",width = 480, height = 480)
plot( twoDaysData$dateTime, twoDaysData$Global_active_power,  type="l", xlab="",  ylab="Global Active Power (kilowatts)")

dev.off()
