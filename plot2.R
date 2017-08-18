##Use library dplyr tot make manipulation of data easy
library(dplyr)

##Open .png graphics
png(filename = "plot2.png")

##Group and sum data by year
summed_emmissions_by_year_balt<-
        NEI %>%
        filter(fips=="24510") %>%
        group_by(year) %>%
        summarise(Total_emission=sum(Emissions))

##Plot data using line to make easy visible
with(summed_emmissions_by_year_balt,plot(year,Total_emission,type='l'))

##Close .png to write plot
dev.off()