# read the data into memory
elec <- read.table("elec/household_power_consumption.txt",
                   header=TRUE,
                   sep=";",
                   na.string="?",
                   stringsAsFactors=FALSE)

# subset for the specified dates
elec_sub <- elec[,1]==("1/2/2007") | elec[,1]==("2/2/2007")
elec_sub <- elec[elec_sub,]

# generate a new column[,10] "Date_Time" with $Date and $Time pasted together
Date_Time <-strptime(paste(elec_sub[,1],elec_sub[,2]),
                     "%d/%m/%Y %H:%M:%S")
el_dat <- cbind(elec_sub,Date_Time)

# generate a histogram into a png file
png("plot1.png")
hist(el_dat$Global_active_power,
     col="red",
     xlab="Global Active Power(kilowatts)",
     main="Global Active Power")
dev.off()

