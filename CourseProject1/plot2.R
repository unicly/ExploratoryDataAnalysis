file <- "household_power_consumption.txt"

# Create the data frame
df <- read.csv(file, header = TRUE, dec = ".", sep = ";", na.strings = "?")
subset_df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007", select=c(Date, Time, Global_active_power))

# Set the x and y variables
y <- as.numeric(as.character(subset_df$Global_active_power))
x <- strptime(paste(subset_df$Date, subset_df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")
plot(x, y, type = "l", xlab= "", ylab="Global Active power (kilowatts)")
dev.off()
