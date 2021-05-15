#Carl Flynn
#x17347726

#Loading Package
library(tidyverse)

#1
setwd("C:/Users/CarlF/OneDrive/Desktop/4thYearProject/Data/Big3")

#Loading Data
SonyRevenue <- read.csv("SonyRevenue.csv", header = TRUE)
UniversalRevenue <- read.csv("UniversalRevenue.csv", header = TRUE)
WarnerRevenue <- read.csv("WarnerRevenue.csv", header = TRUE)
SpotifyRevenue <- read.csv("SpotifyRevenue.csv", header = TRUE)

#Transforming Columns
SonyRevenue <- rename(SonyRevenue, Year = ï..Year)
UniversalRevenue <- rename(UniversalRevenue, Year = ï..Year)
WarnerRevenue <- rename(WarnerRevenue, Year = ï..Year)
SonyRevenue <- rename(SonyRevenue, SonyRevenue = Amount)
UniversalRevenue <- rename(UniversalRevenue, UniversalRevenue = Amount)
WarnerRevenue <- rename(WarnerRevenue, WarnerRevenue = Amount)
UniversalRevenue <- UniversalRevenue[,-which(names(UniversalRevenue) %in% c("Year"))]
WarnerRevenue <- WarnerRevenue[,-which(names(WarnerRevenue) %in% c("Year"))]


#Removing invalid entries
UniversalRevenue <- UniversalRevenue[-which(UniversalRevenue$Year == "2004"), ]
UniversalRevenue <- UniversalRevenue[-which(UniversalRevenue$Year == "2005"), ]
WarnerRevenue <- WarnerRevenue[-which(WarnerRevenue$Year == "2004"), ]
WarnerRevenue <- WarnerRevenue[-which(WarnerRevenue$Year == "2005"), ]

#Combine Data
CombinedRevenues <- cbind(SonyRevenue, UniversalRevenue, WarnerRevenue)

#Write to file
write.csv(CombinedRevenues, "CombinedRevenue.csv")


#2
setwd("C:/Users/CarlF/OneDrive/Desktop/4thYearProject/Data/Revenue")

AusRevenue <- read.csv("AusIndustryRevenue.csv", header = TRUE)
ChinaRevenue <- read.csv("ChinaRevenue.csv", header = TRUE)
USRevenue <- read.csv("USRevenue.csv", header = TRUE)
EuropeRevenue <- read.csv("EuropeRevenue.csv", header = TRUE)

AusRevenue <- rename(AusRevenue, Year = ï..Year)
ChinaRevenue <- rename(ChinaRevenue, Year = ï..Year)
EuropeRevenue <- rename(EuropeRevenue, Year = ï..Year)
USRevenue <- rename(USRevenue, Year = ï..Year)

EuropeRevenue <- EuropeRevenue[-c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17), ]
AusRevenue <- AusRevenue[-c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 17, 18, 19, 20, 21), ]
ChinaRevenue <- ChinaRevenue[-c(7, 8, 9, 10), ]
USRevenue <- USRevenue[-c(1, 2, 3, 4, 5), ]

EuropeRevenue <- rename(EuropeRevenue, EuropeRevenue = Amount)
AusRevenue <- rename(AusRevenue, AusRevenue = Amount)
ChinaRevenue <- rename(ChinaRevenue, ChinaRevenue = Amount)
USRevenue <- rename(USRevenue, USRevenue = Amount)

AusRevenue <- AusRevenue[,-which(names(AusRevenue) %in% c("Year"))]
ChinaRevenue <- ChinaRevenue[,-which(names(ChinaRevenue) %in% c("Year"))]
USRevenue <- USRevenue[,-which(names(USRevenue) %in% c("Year"))]

RegionRevenues <- cbind(EuropeRevenue, AusRevenue, USRevenue, ChinaRevenue)

write.csv(RegionRevenues, "RegionRevenues.csv")


#3
setwd("C:/Users/CarlF/OneDrive/Desktop/4thYearProject/Data/Worldwide")

IndustryRevenue <- read.csv("IndustryRevenue.csv", header = TRUE)
StreamingRevenue <- read.csv("StreamingRevenue.csv", header = TRUE)

IndustryRevenue <- rename(IndustryRevenue, Year = ï..Year)
StreamingRevenue <- rename(StreamingRevenue, Year = ï..Year)
IndustryRevenue <- rename(IndustryRevenue, IndustryRevenue = Amount)

StreamingRevenue <- StreamingRevenue[,-which(names(StreamingRevenue) %in% c("Year"))]

IndustryRevenue <- IndustryRevenue[-c(1, 2, 3, 4, 5, 6), ]

IndustryVsStreaming <- cbind(IndustryRevenue, StreamingRevenue)

write.csv(IndustryVsStreaming, "IndustryVsStreaming.csv")

#4

FormatShares <- read.csv("FormatShares7320.csv", header = TRUE)

#Removing unnecessary columns
FormatShares <- FormatShares[,-which(names(FormatShares) %in% c("X1973","X1974","X1975","X1976","X1977","X1978","X1979",
                                                                "X1980","X1981","X1982","X1983","X1984","X1985","X1986","X1987","X1988","X1989","X1990","X1991","X1992","X1993","X1994",
                                                                "X1995","X1996","X1997","X1998","X1999","X2000","X2001","X2002","X2003","X2004","X2005"))]

#Renaming columns
FormatShares <- rename(FormatShares, "2006" = X2006)
FormatShares <- rename(FormatShares, "2007" = X2007)
FormatShares <- rename(FormatShares, "2008" = X2008)
FormatShares <- rename(FormatShares, "2009" = X2009)
FormatShares <- rename(FormatShares, "2010" = X2010)
FormatShares <- rename(FormatShares, "2011" = X2011)
FormatShares <- rename(FormatShares, "2012" = X2012)
FormatShares <- rename(FormatShares, "2013" = X2013)
FormatShares <- rename(FormatShares, "2014" = X2014)
FormatShares <- rename(FormatShares, "2015" = X2015)
FormatShares <- rename(FormatShares, "2016" = X2016)
FormatShares <- rename(FormatShares, "2017" = X2017)
FormatShares <- rename(FormatShares, "2018" = X2018)
FormatShares <- rename(FormatShares, "2019" = X2019)

write.csv(FormatShares, "FormatShares.csv")





