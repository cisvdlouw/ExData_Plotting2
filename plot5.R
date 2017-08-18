##Use library dplyr tot make manipulation of data easy
library(dplyr)

##Open .png graphics
png(filename = "plot5.png")

##Filter SCC to required lines for join (ie containing motor vehicles)
## I assumed cointaining coals means filtering based on Motor Vehicles in SCC$SCC.Level.Three
filtered_scc_motor_vehicle<-SCC[grepl(pattern = "Motor Vehicles",SCC$SCC.Level.Three),]

##Join gfiltered scc with NEI to only have the coal related outputs left
motor_vehicle_NEI<-merge(NEI,filtered_scc,by.x = 'SCC',by.y = 'SCC')

##Group and sum data by year and filter balt
summed_emmissions_by_year_motor<-
        motor_vehicle_NEI %>%
        filter(fips=="24510") %>%
        group_by(year) %>%
        summarise(Total_emission=sum(Emissions))

##Plot data using line to make easy visible
with(summed_emmissions_by_year_motor,plot(year,Total_emission,type='l'))

##Close .png to write plot
dev.off()