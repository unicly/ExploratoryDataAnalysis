file <- "household_power_consumption.txt"

# Create the data frame
df <- read.csv(file, header = TRUE, dec = ".", sep = ";", na.strings = "?")
subset_df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007", select=c(Date, Time, Global_active_power, Sub_metering_1, Sub_metering_2, Sub_metering_3, Voltage, Global_reactive_power))

# Set the x and y variables
y <- as.numeric(as.character(subset_df$Global_active_power))
x <- strptime(paste(subset_df$Date, subset_df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
y_sub_1 <- as.numeric(as.character(subset_df$Sub_metering_1))
y_sub_2 <- as.numeric(as.character(subset_df$Sub_metering_2))
y_sub_3 <- as.numeric(as.character(subset_df$Sub_metering_3))
y_voltage <- as.numeric(as.character(subset_df$Voltage))
y_global_reactive <- as.numeric(as.character(subset_df$Global_reactive_power))

png(file = "plot4.png")

par(mfrow = c(2,2))

# Plot 1.
plot(x, y, type = "l", xlab= "", ylab="Global Active power (kilowatts)")

# Plot 2.
plot(x, y_voltage, type = "l", xlab= "", ylab="Voltage")

# Plot 3.
with(df, {
    plot(x, y_sub_1, type = "l", xlab= "", ylab="Energy sub metering", col = "Black")
})

lines(x, y_sub_2, col = "Red")
lines(x, y_sub_3, col = "Blue")

legend("topright", lty=1, lwd =3, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4.
plot(x, y_global_reactive, type = "l", xlab= "datetime", ylab="Global_reactive_power")

dev.off()
