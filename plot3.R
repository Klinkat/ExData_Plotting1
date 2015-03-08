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

# plots Date_Time vs.  Energy Sub Metering 1, 2, 3
png("plot3.png")
with(el_dat,
     plot(Date_Time,Sub_metering_1,
          type="n",
          xlab=NA,
          ylab="Energy sub metering",
          )
)
with(subset(el_dat),lines(Date_Time,Sub_metering_1))
with(subset(el_dat),lines(Date_Time,Sub_metering_2,col="red"))
with(subset(el_dat),lines(Date_Time,Sub_metering_3,col="blue"))
legend("topright",lwd=2,c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"))
dev.off()

