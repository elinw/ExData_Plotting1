library("data.table")
if (!file.exists("edadata")){
        dir.create("edadata")
}
## Set up file definitions and download the data
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile<-"./edadata/electricity.zip"
download.file(url=fileUrl,
              destfile=destfile)
datedownloaded<-date()
## From Stack Overflow
## Definte custom date and time classes
setAs("character","myDate", function(from) as.IDate(from, format="%d/%m/%Y") )
setClass("myDate")
setAs("character","myTime", function(from) as.ITime(from, format="%H:%M:%S") )
setClass("myTime")

## Read in the data, managing the ? used for missing data.
electricitydata<-read.table(
        unzip(destfile), 
        na.strings=c("?"),
        sep=";",
        fill=TRUE,
        header=TRUE,
        colClasses=c("myDate", "myTime", "numeric", "numeric", 
                     "numeric", "numeric", "numeric", "numeric", "numeric")
        )
## Subset the data to the two days for analysis
trimmeddata<-electricitydata[electricitydata$Date==as.IDate("2007-02-01") | electricitydata$Date==as.IDate("2007-02-02"),]

## create the datetime variable
trimmeddata <- within(
                trimmeddata, datetime <- as.POSIXct(trimmeddata$Date, trimmeddata$Time)
        )
                      
saveRDS(trimmeddata, file="./edadata/electricityuse.Rda")