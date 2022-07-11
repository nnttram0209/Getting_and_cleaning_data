fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
df_down <- download.file(fileurl, dest = "Idaho_Housing.csv", method = "curl")
df <- read.csv("Idaho_Housing.csv")

#Q1
library(dplyr)
df1 <- select(df, c(ACR, AGS))
ACR_col <- df1$ACR
AGS_col <- df1$AGS
agricultureLogical <- ACR_col == 3 & AGS_col == 6
which(agricultureLogical)

#Q2
fileurl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
install.packages("jpeg")
library("jpeg")
download.file(fileurl2, destfile = "Jeff.jpeg", mode = "wb")
df2 <- readJPEG("Jeff.jpeg", native = TRUE)
quantile_30 <- quantile(df2, probs = 0.3)
quantile_30
quantile_80 <- quantile(df2, probs = 0.8)
quantile_80

#Q3
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url1, destfile = "file1.csv", method = "curl")
download.file(url2, destfile = "file2.csv", method = "curl")
file1 <- read.csv("file1.csv", skip = 3)
colnames(file1)[1] <- "CountryCode"
file2 <- read.csv("file2.csv")
names(file1)
names(file2)
final_file <- merge(file1, file2, by = "CountryCode", all=FALSE)
head(final_file,15)
library(dplyr)
final_file <- arrange(final_file,desc(Ranking))
final_file[13,"Long.Name"]
sum(!is.na(final_file[,2]))

#Q4
names(final_file) #dasdasdasdasdasd
data4 <- final_file[!is.na(final_file$Ranking),c(1,2,12)]
dim(data4)
tbl_df(data4)
data4s <- data4 %>% group_by(Income.Group) 
averageGDP <- summarize(data4s, averageGDPRanking = mean(Ranking))
averageGDP