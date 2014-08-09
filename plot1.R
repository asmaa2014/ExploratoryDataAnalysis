#Exploratory Data Analysis
#Project 1, Plot1

plot1 <- function(){
	
#Read data from dates 2007-02-01 and 2007-02-02 from the file

hpc <- "household_power_consumption.txt"
fi <- file(hpc)

library(sqldf)

df <- sqldf("select * from fi where Date == '1/2/2007' or Date == '2/2/2007'",
            file.format = list(header = TRUE, sep = ";"))
close(fi)

#Create png device

png(file="plot1.png")

#Assign margins
par(mar=c(10,6,4,4))

#Draw histogram
hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowattes)", col="Red")

#close the device
dev.off()
}

