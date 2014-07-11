## EDA Project 1, Plot 2
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
png(file="./plots/plot2.png", width=480, height=480)

## Create the plot
par(bg="transparent")
plot(
        electricityuse$datetime,electrictyuse$Global_active_power, 
        type="l", 
        main="Global Active Power",
        ylab="Global Active Power (kilowatts)",
        ##xlab="Date",
        bg="transparent"

     )

## Comment next line if you want plots to go to screen.
dev.off() 
