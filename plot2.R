# Download and unzip data
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip_file <- "household_power_consumption.zip"
download.file(dataset_url, zip_file)
unzip(zip_file)

# Read data
file_name <- "household_power_consumption.txt"
types <- c("character",
           "character",
           rep("numeric", 7))
all_data <- read.table(file_name,
                       header = TRUE,
                       sep = ";",
                       stringsAsFactors = FALSE,
                       na.strings = "?",
                       colClasses = types)

# Preprocess data
data <- subset(all_data, all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")

# Prepare plot
plot_file = "plot2.png"
png(filename = plot_file)
with(data, plot(Global_active_power ~ as.POSIXct(DateTime),
                type = "l",
                ylab = "Global Active Power (kilowatts)",
                xlab = NA))
dev.off()




