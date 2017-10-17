if(!require(ggplot2)) {
        install.packages("ggplot2")
}

URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

if (!file.exists("./tmp"))
        dir.create("./tmp")
if (!file.exists("./pm25_data"))
        dir.create("./pm25_data")

if (!file.exists("./tmp/pm25data.zip")) {
        download.file(URL, destfile = "./tmp/pm25data.zip")
} else {
        unzip("./tmp/pm25data.zip",
              exdir = "./pm25_data",
              overwrite = FALSE)
}

NEI <- readRDS("./pm25_data/summarySCC_PM25.rds")
SCC <- readRDS("./pm25_data/Source_Classification_Code.rds")

baltimoreEmissions <- NEI[NEI$fips == "24510",]
baltimoreEmissionsBySource <-
        aggregate(
                baltimoreEmissions[c("Emissions")],
                list(Source = baltimoreEmissions$type, 
                     Year = baltimoreEmissions$year),
                sum
        )
plot3 <- qplot(
        Year,
        Emissions,
        data = baltimoreEmissionsBySource,
        color = Source,
        xlab = "Year",
        geom = "path",
        ylab = "Emissions of PM2.5, tonn",
        main = "Sources of emissions from PM2.5 in Baltimore, for the years 1999, 2002, 2005, and 2008"
)
print(plot3)
dev.copy(png, filename = "Plot3.png", width=640, height=480)
dev.off()
