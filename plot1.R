
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

####### plot 1
png("plot1.png",width = 480, height = 480)
hist(twoDaysData$Global_active_power , col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()