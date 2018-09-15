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
data <- subset(all_data, all_data$Date == "1/2/2007" | all_data$Date == "1/2/2007")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")

# Prepare plot
plot_file = "plot1.png"
png(filename = plot_file)
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "Red")
dev.off()




