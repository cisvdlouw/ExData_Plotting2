##Use library dplyr tot make manipulation of data easy
##Use library ggplot2 to plot with ggplot
library(dplyr)
library(ggplot2)

##Open .png graphics
png(filename = "plot3.png")

##Group and sum data by year and type, filter balt
summed_emmissions_by_year_and_type<-
        NEI %>%
        filter(fips=="24510") %>%
        group_by(year,type) %>%
        summarise(Total_emission=sum(Emissions))

##Plot data using line to make easy visible
ggplot(data=summed_emmissions_by_year_and_type)+geom_line(data=summed_emmissions_by_year_and_type,aes(x=year,y=Total_emission,col=type))

##Close .png to write plot
dev.off()