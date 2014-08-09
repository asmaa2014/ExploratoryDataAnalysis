#Exploratory Data Analysis
#Project 1, Plot3

plot3 <- function(){
	
#Read data from dates 2007-02-01 and 2007-02-02 from the file

hpc <- "household_power_consumption.txt"
fi <- file(hpc)

library(sqldf)

df <- sqldf("select * from fi where Date == '1/2/2007' or Date == '2/2/2007'",
    file.format=list(header=TRUE,sep=";"))
    
close(fi)

#Create png device

png(file="plot3.png")

#Transform date & time strings to date/time type
df1 = transform (df, Date = strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))

#Assign margins
par(mar=c(10,6,4,4))

#Draw plot

#Sub_metering_1
with(df1, plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering"))

#Sub_metering_2
par(new=TRUE)
with(df1, plot(Date, Sub_metering_2, type="l", col="Red", ylim=range(c(0, 40)), axes=FALSE, xlab="", ylab=""))

#Sub_metering_3
par(new=TRUE)
with(df1, plot(Date, Sub_metering_3, type="l", col="Blue", ylim=range(c(0, 40)), axes=FALSE, xlab="", ylab=""))

#legend
legend("topright", lwd=2, col=c("Black", "Red", "Blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#close the device
dev.off()
}

