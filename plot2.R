
classesOfCols <- c("character", "character", rep("numeric",7) )
namesOfCols<- c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")

df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", col.names=namesOfCols, colClasses=classesOfCols, na.strings="?")

df$date <-  as.Date(df$date, format="%d/%m/%Y")
df <- df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]


#make plot and save the graph
png(filename="ExData_Plotting1/plot2.png", width=480, height=480, units="px")
plot(df$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))
dev.off()