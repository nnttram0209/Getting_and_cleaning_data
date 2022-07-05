getwd()
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile = "Idaho_Housing.csv", method = "curl")

df <- read.csv("Idaho_Housing.csv")
class(df)
#Q1
VAL <- df[complete.cases(df$VAL), "VAL"]
length(VAL[property_value == 24])

#Q2
FES <- df$FES
FES

#Q3
fileurl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileurl2, destfile = "NGAP.xlsx", mode="wb")
library("xlsx")
NGAP <- read.xlsx("data/NGAP.xlsx", sheetIndex=1, header=TRUE)
dat <- NGAP[c(18,23),c(7,15)]
sum(dat$Zip*dat$Ext,na.rm=T)

#Q4
install.packages("XML")
library("XML")
Baltimore_xml <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
Baltimore <- xmlToDataFrame(Baltimore_xml)
Baltimore