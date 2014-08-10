#Exploratory Data Analysis
#Project 1, Plot4

plot4 <- function(){
	
#Read data from dates 2007-02-01 and 2007-02-02 from the file

hpc <- "household_power_consumption.txt"
fi <- file(hpc)

library(sqldf)

df <- sqldf("select * from fi where Date == '1/2/2007' or Date == '2/2/2007'",
    file.format=list(header=TRUE,sep=";"))
    
close(fi)

#Create png device

png(file="plot4.png")

#Transform date & time strings to date/time type
df1 = transform (df, Date = strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))

#Settings
par(mfcol=c(2,2), mar=c(4, 4, 2, 2))

#Draw plot

with (df1, {
	plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowattes)")

	plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
	with (df1, lines(Date, Sub_metering_2, type="l", col="Red", ylim=range(c(0, 40))))
	with (df1, lines(Date, Sub_metering_3, type="l", col="Blue", ylim=range(c(0, 40))))
	legend("topright", lwd=2, box.lwd=0, col=c("Black", "Red", "Blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
	plot(Date, Voltage, type="l", xlab="datetime", ylab="Voltage")
	plot(Date, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
	})


#close the device
dev.off()
}

