## EDA Project 1, Plot 1
## If the dataset does not exist yet, create it.
if (!file.exists("./edadata/electricityuse.Rda")){
        source("createelectricitydata.R")
}
## Create a folder for the plots
if (!file.exists("plots")){
        dir.create("plots")
}
## Load the data
electricityuse<-readRDS(file="./edadata/electricityuse.Rda")

## Open graphics device. Comment next line if you want plots to go to the screen.
png(file="./plots/plot1.png", width=480, height=480)
par(bg="transparent")
## Create the histogam
hist(
        electrictyuse$Global_active_power, 
        col="red", 
        main="Global Active Power",
        xlab="Global Active Power (kilowatts)",
        bg="transparent"
     )
## Comment next line if you want plots to go to screen.
dev.off() 
