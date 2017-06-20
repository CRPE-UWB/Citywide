
rm(list=ls()) 


library(plyr)
library(dplyr)
library(foreign)

setwd("/Users/lualt/OneDrive/Work/CRPE/City Wide/EdFacts/") # if on PC
setwd("/Users/Alton/OneDrive/Work/CRPE/City Wide/EdFacts/") # if on Mac 

namelist <- c("STNAM", "FIPST", "LEAID", "LEANM", "ncessch",
              "SCHNAM", "ALL_COHORT", "ALL_RATE", "MAM_COHORT",
              "MAM_RATE", "MAS_COHORT", "MAS_RATE", "MBL_COHORT",
              "MBL_RATE", "MHI_COHORT", "MHI_RATE", "MTR_COHORT",
              "MTR_RATE", "MWH_COHORT", "MWH_RATE", "CWD_COHORT",
              "MCWD_RATE", "ECD_COHORT", "ECD_RATE", "LEP_COHORT",
              "LEP_RATE", "YEAR")

# 2015 --------------------------------------------------------------------
data <- read.csv("EdFacts 2015.csv", na.strings = ".")
names(data) <- namelist
glimpse(data)


for(i in 1:dim(data)[2]) {
  if(class(data[,i]) == "factor")
    data[,i] <- as.character(data[,i])
}

data[data == "GE95"] <- "95"
data[data == "GE90"] <- "90"
data[data == "GE80"] <- "80"
data[data == "GE50"] <- "50"

data$ALL_RATE <- sapply(strsplit(data$ALL_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MAM_RATE <- sapply(strsplit(data$MAM_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MAS_RATE <- sapply(strsplit(data$MAS_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MBL_RATE <- sapply(strsplit(data$MBL_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MHI_RATE <- sapply(strsplit(data$MHI_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MTR_RATE <- sapply(strsplit(data$MTR_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MWH_RATE <- sapply(strsplit(data$MWH_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$CWD_RATE <- sapply(strsplit(data$CWD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MCWD_RATE <- sapply(strsplit(data$MCWD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$ECD_RATE <- sapply(strsplit(data$ECD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$LEP_RATE <- sapply(strsplit(data$LEP_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))

data$YEAR <- "2015"

df <- data

# 2014 --------------------------------------------------------------------
data <- read.csv("EdFacts 2014.csv", na.strings = ".")
names(data) <- namelist
glimpse(data)


for(i in 1:dim(data)[2]) {
  if(class(data[,i]) == "factor")
    data[,i] <- as.character(data[,i])
}

data[data == "GE95"] <- "95"
data[data == "GE90"] <- "90"
data[data == "GE80"] <- "80"
data[data == "GE50"] <- "50"

data$ALL_RATE <- sapply(strsplit(data$ALL_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MAM_RATE <- sapply(strsplit(data$MAM_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MAS_RATE <- sapply(strsplit(data$MAS_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MBL_RATE <- sapply(strsplit(data$MBL_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MHI_RATE <- sapply(strsplit(data$MHI_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MTR_RATE <- sapply(strsplit(data$MTR_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MWH_RATE <- sapply(strsplit(data$MWH_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$CWD_RATE <- sapply(strsplit(data$CWD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MCWD_RATE <- sapply(strsplit(data$MCWD_RATE, split = "-"),
                         function(x) mean(as.numeric(x)))
data$ECD_RATE <- sapply(strsplit(data$ECD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$LEP_RATE <- sapply(strsplit(data$LEP_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))

data$YEAR <- "2014"
data <- select(data, -28)

df <- rbind(df, data)

# 2013 --------------------------------------------------------------------
data <- read.csv("EdFacts 2013.csv", na.strings = ".")
names(data) <- namelist
glimpse(data)


for(i in 1:dim(data)[2]) {
  if(class(data[,i]) == "factor")
    data[,i] <- as.character(data[,i])
}

data[data == "GE95"] <- "95"
data[data == "GE90"] <- "90"
data[data == "GE80"] <- "80"
data[data == "GE50"] <- "50"

data$ALL_RATE <- sapply(strsplit(data$ALL_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MAM_RATE <- sapply(strsplit(data$MAM_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MAS_RATE <- sapply(strsplit(data$MAS_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MBL_RATE <- sapply(strsplit(data$MBL_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MHI_RATE <- sapply(strsplit(data$MHI_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MTR_RATE <- sapply(strsplit(data$MTR_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MWH_RATE <- sapply(strsplit(data$MWH_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$CWD_RATE <- sapply(strsplit(data$CWD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MCWD_RATE <- sapply(strsplit(data$MCWD_RATE, split = "-"),
                         function(x) mean(as.numeric(x)))
data$ECD_RATE <- sapply(strsplit(data$ECD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$LEP_RATE <- sapply(strsplit(data$LEP_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))

data$YEAR <- "2013"

df <- rbind(df, data)

# 2012 --------------------------------------------------------------------
data <- read.csv("EdFacts 2012.csv", na.strings = ".")
names(data) <- namelist
glimpse(data)


for(i in 1:dim(data)[2]) {
  if(class(data[,i]) == "factor")
    data[,i] <- as.character(data[,i])
}

data[data == "GE95"] <- "95"
data[data == "GE90"] <- "90"
data[data == "GE80"] <- "80"
data[data == "GE50"] <- "50"

data$ALL_RATE <- sapply(strsplit(data$ALL_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MAM_RATE <- sapply(strsplit(data$MAM_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MAS_RATE <- sapply(strsplit(data$MAS_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MBL_RATE <- sapply(strsplit(data$MBL_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MHI_RATE <- sapply(strsplit(data$MHI_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MTR_RATE <- sapply(strsplit(data$MTR_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MWH_RATE <- sapply(strsplit(data$MWH_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$CWD_RATE <- sapply(strsplit(data$CWD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MCWD_RATE <- sapply(strsplit(data$MCWD_RATE, split = "-"),
                         function(x) mean(as.numeric(x)))
data$ECD_RATE <- sapply(strsplit(data$ECD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$LEP_RATE <- sapply(strsplit(data$LEP_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))

data$YEAR <- "2012"

df <- rbind(df, data)

# 2011 --------------------------------------------------------------------
data <- read.csv("EdFacts 2011.csv", na.strings = ".")
names(data) <- namelist
glimpse(data)


for(i in 1:dim(data)[2]) {
  if(class(data[,i]) == "factor")
    data[,i] <- as.character(data[,i])
}

data[data == "GE95"] <- "95"
data[data == "GE90"] <- "90"
data[data == "GE80"] <- "80"
data[data == "GE50"] <- "50"

data$ALL_RATE <- sapply(strsplit(data$ALL_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MAM_RATE <- sapply(strsplit(data$MAM_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MAS_RATE <- sapply(strsplit(data$MAS_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MBL_RATE <- sapply(strsplit(data$MBL_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MHI_RATE <- sapply(strsplit(data$MHI_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MTR_RATE <- sapply(strsplit(data$MTR_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MWH_RATE <- sapply(strsplit(data$MWH_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$CWD_RATE <- sapply(strsplit(data$CWD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$MCWD_RATE <- sapply(strsplit(data$MCWD_RATE, split = "-"),
                         function(x) mean(as.numeric(x)))
data$ECD_RATE <- sapply(strsplit(data$ECD_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))
data$LEP_RATE <- sapply(strsplit(data$LEP_RATE, split = "-"),
                        function(x) mean(as.numeric(x)))

data$YEAR <- "2011"

df <- rbind(df, data)


write.csv(df, "EdFacts_Alton.csv")


