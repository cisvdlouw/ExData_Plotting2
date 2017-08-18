##Small script to load the data so that it works with my scripts
##Assumption that data is in the working directory
##Also installs required packages

install.packages("dplyr")
install.packages("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")