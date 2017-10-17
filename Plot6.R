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

motorSources <-
        SCC[grep("motor|vehicle", SCC$EI.Sector, ignore.case = TRUE), c("SCC", "Short.Name")]
baltimoreMotorEmissions <-
        NEI[NEI$SCC %in% motorSources$SCC &
                    NEI$fips == "24510",]
losangelesMotorEmissions <-
        NEI[NEI$SCC %in% motorSources$SCC &
                    NEI$fips == "06037", ]
twocityMotorEmissions <-
        rbind (losangelesMotorEmissions, baltimoreMotorEmissions)
twocityMotorEmissionsByFips <-
        aggregate(
                twocityMotorEmissions[c("Emissions")],
                list(City = twocityMotorEmissions$fips,
                     Year = twocityMotorEmissions$year),
                sum
        )
twocityMotorEmissionsByFips$City <-
        factor(
                twocityMotorEmissionsByFips$City,
                levels = c("06037", "24510"),
                labels = c("Los Angeles, CA", "Baltimore City, MD")
        )

plot6 <- qplot(
        Year,
        Emissions,
        data = twocityMotorEmissionsByFips,
        color = City,
        xlab = "Year",
        geom = "path",
        ylab = "Motor vehicle PM2.5 emissions, tonn",
        main = "Changes in Motor vehicle emissions from PM2.5
        in Baltimore compred to Los Angeles County,
        for the years 1999, 2002, 2005, and 2008"
) + theme(plot.title = element_text(hjust = 0.5))
print(plot6)

dev.copy(png,
         filename = "Plot6.png",
         width = 640,
         height = 480)
dev.copy(png, filename = "Plot6.png")
dev.off(
)