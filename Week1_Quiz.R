getwd()
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile = "Idaho_Housing.csv", method = "curl")
df <- read.csv("Idaho_Housing.csv")
class(df)
#Q1
VAL <- df[complete.cases(df$VAL), "VAL"]
length(VAL[VAL == 24])

#Q2
FES <- df$FES
FES

#Q3
fileurl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileurl2, destfile = "NGAP.xlsx", method = "curl")
library("xlsx")
NGAP <- read.xlsx("NGAP.xlsx", sheetIndex=1, header = FALSE)
dat <- NGAP[18:23,7:15]
names(dat) <- as.matrix(dat[1, ])
dat <- dat[-1, ]
dat[] <- lapply(dat, function(x) type.convert(as.character(x)))
dat
sum(dat$Zip*dat$Ext,na.rm=T)

#Q4 --> Vua mo dap an tren internet vua xem lai bai giang de lam
install.packages("XML")
library("XML")
Baltimore_xml <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
Baltimore <- xmlTreeParse(Baltimore_xml, useInternalNodes = TRUE)
rootNode <- xmlRoot(Baltimore)
zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
zipcode
count <- length(which(zipcode == 21231))
count

#Q5
fileurl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
df5 <- download.file(fileurl3, destfile = "Idaho.csv", methods = "curl")
install.packages("data.table")
library(data.table)
DT <- fread("Idaho.csv")
