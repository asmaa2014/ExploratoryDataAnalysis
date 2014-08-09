#Exploratory Data Analysis
#Project 1, Plot2

plot2 <- function(){
	
#Read data from dates 2007-02-01 and 2007-02-02 from the file

hpc <- "household_power_consumption.txt"
fi <- file(hpc)

library(sqldf)

df <- sqldf("select * from fi where Date == '1/2/2007' or Date == '2/2/2007'",
    file.format=list(header=TRUE,sep=";"))
    
close(fi)

#Create png device

png(file="plot2.png")

#Transform date & time strings to date/time type
df1 = transform (df, Date = strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))

#Draw plot
with(df1, plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowattes)"))

#close the device
dev.off()
}

