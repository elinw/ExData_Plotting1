## EDA Project 1, Plot 4
## If the dataset does not exist yet, create it.
if (!file.exists("./edadata/electricityuse.Rda")){
        source("createelectricitydata.R")
}
## Create a folder for the plots if it does not exist.
if (!file.exists("plots")){
        dir.create("plots")
}
## Load the data
electricityuse<-readRDS(file="./edadata/electricityuse.Rda")

## Comment this if you want the plot to go to the screen.
png(file="./plots/plot4.png", width=480, height=480)
## Make two rows and two columns
par(mfcol=c(2,2), bg="transparent")
with (electricityuse, 
        {
                plot(
                        electricityuse$datetime,electricityuse$Global_active_power, 
                        type="l", 
                        ylab="Global Active Power", 
                        xlab="",
                        bg="transparent"
                        
                )
                
                plot(
                        electricityuse$datetime,electricityuse$Sub_metering_1, 
                        type="l", 
                        col="black",
                        ylab="Energy sub metering",
                        xlab="",
                        bg="transparent"
                )
                ## Add a legend
                lines(electricityuse$datetime,electricityuse$Sub_metering_3,  col="blue")
                lines(electricityuse$datetime,electricityuse$Sub_metering_2,  col="red")
                datanames<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
                legcolors<-c("black","red", "blue")
                
                legend( 
                        "topright",
                        lty=1,
                        legend=datanames,
                        col=legcolors,
                        bty="n"
                )
                
                plot(
                        electricityuse$datetime,electricityuse$Voltage, 
                        type="l", 
                        main="",
                        ylab="Voltage",
                        xlab="datetime",
                        bg="transparent",
                )
        
                plot(
                        electricityuse$datetime,electricityuse$Global_reactive_power, 
                        type="l", 
                        main="",
                        ylab="Global_reactive_power",
                        xlab="datetime",
                        bg="transparent",
                )
                
        }
)
## Comment this line if you want the plot to go to the window.
dev.off() 