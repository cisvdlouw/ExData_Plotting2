##Use library dplyr tot make manipulation of data easy
library(dplyr)

##Open .png graphics
png(filename = "plot4.png")

##Filter SCC to required lines for join (ie containing coal)
## I assumed cointaining coals means filtering based on coal/Coal in SCC$Short.Name
filtered_scc<-SCC[grepl(pattern = "coal|Coal",SCC$Short.Name),]

##Join gfiltered scc with NEI to only have the coal related outputs left
coal_NEI<-merge(NEI,filtered_scc,by.x = 'SCC',by.y = 'SCC')

##Group and sum data by year
summed_emmissions_by_year_coal<-
        coal_NEI %>%
        group_by(year) %>%
        summarise(Total_emission=sum(Emissions))

##Plot data using line to make easy visible
with(summed_emmissions_by_year_coal,plot(year,Total_emission,type='l'))

##Close .png to write plot
dev.off()