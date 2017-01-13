# Reads in data from file in the working directory
input <- fread("household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
# subsets data for specified dates
subset_data <- rbind(input[input$Date=="1/2/2007",],input[input$Date=="2/2/2007",])

# transform date to Date format
subset_data$Date <- as.Date(subset_data$Date,"%d/%m/%Y")
# create new variable with Date and Time
subset_data<-cbind(subset_data, "DateTime" = as.POSIXct(paste(subset_data$Date, subset_data$Time)))

# Create PNG (480, 480)
png("plot1.png",width=480, height=480)
# create histogram for Global Active Power
hist(as.numeric(subset_data$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")
# close the png device
dev.off()

