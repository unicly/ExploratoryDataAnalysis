file <- "household_power_consumption.txt"

# Create the data frame
df <- read.csv(file, header = TRUE, dec = ".", sep = ";", na.strings = "?")
subset_df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007", select=c(Date, Time, Global_active_power, Sub_metering_1, Sub_metering_2, Sub_metering_3))

# Set the x and y variables
y1 <- as.numeric(as.character(subset_df$Sub_metering_1))
y2 <- as.numeric(as.character(subset_df$Sub_metering_2))
y3<- as.numeric(as.character(subset_df$Sub_metering_3))
x <- strptime(paste(subset_df$Date, subset_df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")

with(df, {
    plot(x, y1, type = "l", xlab= "", ylab="Energy sub metering", col = "Black")
})

lines(x, y2, col = "Red")
lines(x, y3, col = "Blue")

legend("topright", lty=1, lwd =3, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
