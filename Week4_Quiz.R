#Q1
url1 <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
download.file(url1, destfile = "Idaho.csv", method = "curl")
data1 <- read.csv("Idaho.csv")
head(data1)
install.packages("lubridate")
library(lubridate)
Q1 <- strsplit(names(data1), split = "wgtp")
Q1[[123]]

#Q2
url2 <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")
download.file(url2, destfile = "GDP.csv", method = "curl")
data2 <- read.csv("GDP.csv", skip = 4, nrows = 190)
Q2 <- data2[,5]

Q2s <- as.numeric(gsub(pattern = ",", replacement = "", Q2))
mean(Q2s)

#Q3
countryNames <- data2[,4]
grep("^United", countryNames)