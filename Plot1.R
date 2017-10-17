URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

if (!file.exists("./tmp")) dir.create("./tmp")
if (!file.exists("./pm25_data")) dir.create("./pm25_data")

if (!file.exists("./tmp/pm25data.zip")){
        download.file(
                URL, destfile = "./tmp/pm25data.zip"
        )
} else {
        unzip("./tmp/pm25data.zip", exdir = "./pm25_data", overwrite = FALSE)
}

NEI <- readRDS("./pm25_data/summarySCC_PM25.rds")
SCC <- readRDS("./pm25_data/Source_Classification_Code.rds")

totalEmissions <- with(NEI, tapply(Emissions/1000,year,sum,na.rm=TRUE))

par(mar=c(5,5,4,1))
barplot(totalEmissions, xlab = "Year", ylab = "Total emissions, 1000 tonn", main="Total PM[2.5] emission from all sources \nfor the years 1999, 2002, 2005, and 2008")
dev.copy(png, filename="Plot1.png")
dev.off()