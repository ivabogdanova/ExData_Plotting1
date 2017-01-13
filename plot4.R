# Reads in data from file in the working directory
input <- fread("household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
# subsets data for specified dates
subset_data <- rbind(input[input$Date=="1/2/2007",],input[input$Date=="2/2/2007",])

# transform date to Date format
subset_data$Date <- as.Date(subset_data$Date,"%d/%m/%Y")
# create new variable with Date and Time
subset_data<-cbind(subset_data, "DateTime" = as.POSIXct(paste(subset_data$Date, subset_data$Time)))

# Create PNG (480, 480)
png("plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(subset_data$Global_active_power ~ subset_data$DateTime, type="l", xlab= "", ylab="Global Active Power")
plot(subset_data$Voltage ~ subset_data$DateTime, type="l", xlab="DateTime", ylab="Voltage")

with(subset_data, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy sub metering")})
lines(subset_data$Sub_metering_2 ~ subset_data$DateTime, col = 'Red')
lines(subset_data$Sub_metering_3 ~ subset_data$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(subset_data$Global_reactive_power ~ subset_data$DateTime, type="l", xlab="DateTime", ylab="Global_reactive_power")

# close the png device
dev.off()






