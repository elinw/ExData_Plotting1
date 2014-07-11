## EDA Project 1, Plot 3
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

## Open graphics device. Comment this line out if you want to go to the window instead.
png(file="./plots/plot3.png", width=480, height=480)
par(bg="transparent")
## Create the histogam
plot(
        electricityuse$datetime,electrictyuse$Sub_metering_1, 
        type="l", 
        col="black",
        ##main="Submetering",
        ylab="Energy Sub metering",
        xlab="",
        bg="transparent"
     )
## Set up the legend
lines(electricityuse$datetime,electrictyuse$Sub_metering_3,  col="blue")
lines(electricityuse$datetime,electrictyuse$Sub_metering_2,  col="red")
datanames<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legcolors<-c("black","red", "blue")
legend( 
        "topright",
        lty=1,
        legend=datanames,
        col=legcolors
        )

## Comment out this line if you want plot to go to window.
dev.off() 
