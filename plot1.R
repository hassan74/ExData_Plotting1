
classesOfCols <- c("character", "character", rep("numeric",7) )
namesOfCols<- c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")

df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", col.names=namesOfCols, colClasses=classesOfCols, na.strings="?")

df$date <-  as.Date(df$date, format="%d/%m/%Y")
df <- df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]


png(filename="ExData_Plotting1\plot1.png", width=480, height=480, units="px")
hist(df$globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()