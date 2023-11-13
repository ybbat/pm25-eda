library(dplyr)
library(data.table)

# Download, unzip, merge, save
prep_data <- function() {
    dir.create("data")
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "data/data.zip")
    unzip("data/data.zip", exdir = "data")
    summary <- readRDS("data/summarySCC_PM25.rds")
    codetable <- readRDS("data/Source_Classification_Code.rds") %>% select(SCC, Short.Name, EI.Sector)
    df <- merge(summary, codetable, by="SCC")
    fwrite(df, "data/merged.csv")
}
