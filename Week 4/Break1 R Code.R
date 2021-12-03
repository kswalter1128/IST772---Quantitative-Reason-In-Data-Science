#########################
# First breakout
# 

library(readr)
battData <- read_csv("bBatterydata.csv")
str(battData)
summary(battData)
hist(battData$Time[battData$Battery==1])
hist(battData$Time[battData$Battery==2])

boxplot(Time ~ Battery, data=battData, ylim=c(min(battData$Time)-50,max(battData$Time)+50))

require(data.table)
battData2 <- data.table(battData)
battData2[, .(MeanLife=mean(Time), SDLife=sd(Time)), .(Battery)]

t.test(Time ~ Battery, data=battData)

