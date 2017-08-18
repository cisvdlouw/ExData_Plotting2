##Use library dplyr tot make manipulation of data easy
library(dplyr)

##Open .png graphics
png(filename = "plot1.png")

##Group and sum data by year
summed_emmissions_by_year<-
NEI %>%
        group_by(year) %>%
        summarise(Total_emission=sum(Emissions))

##Plot data using line to make easy visible
with(summed_emmissions_by_year,plot(year,Total_emission,type='l'))

##Close .png to write plot
dev.off()