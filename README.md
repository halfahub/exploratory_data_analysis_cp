# Exploratory data analysis course project

## Data

PM2.5 Emissions Data (𝚜𝚞𝚖𝚖𝚊𝚛𝚢𝚂𝙲𝙲_𝙿𝙼𝟸𝟻.𝚛𝚍𝚜): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year.

* 𝚏𝚒𝚙𝚜: A five-digit number (represented as a string) indicating the U.S. county
* 𝚂𝙲𝙲: The name of the source as indicated by a digit string (see source code classification table)
* 𝙿𝚘𝚕𝚕𝚞𝚝𝚊𝚗𝚝: A string indicating the pollutant
* 𝙴𝚖𝚒𝚜𝚜𝚒𝚘𝚗𝚜: Amount of PM2.5 emitted, in tons
* 𝚝𝚢𝚙𝚎: The type of source (point, non-point, on-road, or non-road)
* 𝚢𝚎𝚊𝚛: The year of emissions recorded 

Source Classification Code Table (𝚂𝚘𝚞𝚛𝚌𝚎_𝙲𝚕𝚊𝚜𝚜𝚒𝚏𝚒𝚌𝚊𝚝𝚒𝚘𝚗_𝙲𝚘𝚍𝚎.𝚛𝚍𝚜): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific.

## Assignment

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

## Questions and answers

### Q1 Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

![Plot 1](https://github.com/halfahub/exploratory_data_analysis_cp/blob/master/Plot1.png?raw=true "Plot 1")

There is a clear downward trend in total emissions from PM2.5 in US in the years 1999, 2002, 2005, and 2008.

### Q2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

![Plot2](https://github.com/halfahub/exploratory_data_analysis_cp/blob/master/Plot2.png?raw=true "Plot 2")

Yes, total emissions from PM2.5 decreased in the Baltimore, Maryland, during the period from 1999 to 2008. 
However, it is seen that throughout the years the situation has not remained stable, and emissions peaked in 2005.

### Q3. Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

![Plot 3](https://github.com/halfahub/exploratory_data_analysis_cp/blob/master/Plot3.png?raw=true "Plot 3")

Emissions for three of four source types (NON-ROAD, NONPOINT and ON-ROAD) have decreased in the end of the period (year 2008) compared to its beginning (year 1999).
Also it can be seen that the most part of decrease occurred in the period from 1999 to 2002 for the same three sources.
Source type POINT shown strong increase during the years 1999-2005, changed to sharp fall ended in 2008 almost on the same level as it showed in 1999.

### Q4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

![Plot 4](https://github.com/halfahub/exploratory_data_analysis_cp/blob/master/Plot4.png?raw=true "Plot 4")

Coal combustion-related emissions decreased by half by 2008 compared to 1999, showing a steady decline throughout the period.

### Q5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

![Plot 5](https://github.com/halfahub/exploratory_data_analysis_cp/blob/master/Plot5.png?raw=true "Plot 5")

Motor vehicle emissions in Baltimore has shown a sharp decline in 2002 by about 60% compared to 1999. However, since 2002, the dynamics changed and by 2005 the levels had not changed, only in 2008 there was a significant decrease


### 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?

![Plot 6](https://github.com/halfahub/exploratory_data_analysis_cp/blob/master/Plot6.png?raw=true "Plot 6")

First noticeable observation is that overall motor vehicle emissions levels are significantly higher in LA compared to Baltimore. Change dynamics is also quite opposite. While PM2.5 from motor vehicles showed a steady decline in Baltimore, especially in the beginning of the period, in LA it was on the rise until 2005, then began to decline. However, even after lowering, the final level of emissions for Los Angeles in 2008 is slightly higher than it was in 1999.