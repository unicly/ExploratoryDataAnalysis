file <- "household_power_consumption.txt"

# Create the data frame
df <- read.csv(file, header = TRUE, dec = ".", sep = ";", na.strings = "?")
subset_df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007", select=c(Date, Global_active_power))

png(file = "plot1.png")
hist(as.numeric(as.character(subset_df$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()


