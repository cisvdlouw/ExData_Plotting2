##Use library dplyr tot make manipulation of data easy
##Use library ggplot2 to plot with ggplot
library(dplyr)
library(ggplot2)

##Open .png graphics
png(filename = "plot6.png")

##Filter SCC to required lines for join (ie containing motor vehicles)
## I assumed cointaining coals means filtering based on Motor Vehicles in SCC$SCC.Level.Three
filtered_scc_motor_vehicle<-SCC[grepl(pattern = "Motor Vehicles",SCC$SCC.Level.Three),]

##Join gfiltered scc with NEI to only have the coal related outputs left
motor_vehicle_NEI<-merge(NEI,filtered_scc,by.x = 'SCC',by.y = 'SCC')

##Group and sum data by year and fips and filter balt and LA
summed_emmissions_by_year_motor<-
        motor_vehicle_NEI %>%
        filter(fips=="24510"|fips == "06037") %>%
        group_by(year,fips) %>%
        summarise(Total_emission=sum(Emissions))

##Plot data using line to make easy visible
ggplot(data=summed_emmissions_by_year_motor)+geom_line(data=summed_emmissions_by_year_motor,aes(x=year,y=Total_emission,col=fips))

##Close .png to write plot
dev.off()