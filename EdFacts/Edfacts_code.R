# EdFacts Graduation Data Cleaning
# June 18 2017
# Alton Lu
# Center on Reinventing Public Education

# This file cleans the EdFacts graduation data
# File: https://www2.ed.gov/about/inits/ed/edfacts/data-files/index.html
# Contains files from 2010-11 - 2014-15
# Additional years can be downloaded and added 

rm(list=ls()) 

library(plyr)
library(dplyr)

setwd("/Users/lualt/OneDrive/Work/CRPE/City Wide/EdFacts/") # if on PC
setwd("/Users/Alton/OneDrive/Work/CRPE/City Wide/EdFacts/") # if on Mac 


# Set a consistent naming scheme
namelist <- c("STNAM", "FIPST", "LEAID", "LEANM", "ncessch",
              "SCHNAM", "ALL_COHORT", "ALL_RATE", "MAM_COHORT",
              "MAM_RATE", "MAS_COHORT", "MAS_RATE", "MBL_COHORT",
              "MBL_RATE", "MHI_COHORT", "MHI_RATE", "MTR_COHORT",
              "MTR_RATE", "MWH_COHORT", "MWH_RATE", "CWD_COHORT", 
              "CWD_RATE", "ECD_COHORT", "ECD_RATE", 
              "LEP_COHORT", "LEP_RATE", "YEAR")


# The function takes in the name of the data frame in your directory and the year
# Will clean everything into the correct format
Clean <- function(data, year){
  data <- read.csv(data, na.strings = ".")
  names(data) <- namelist
  
  # changes all factor types to character types
  for(i in 1:dim(data)[2]) {
    if(class(data[,i]) == "factor")
      data[,i] <- as.character(data[,i])
  }
  
  # Changes these specifics
  data[data == "GE95"] <- "95"
  data[data == "GE90"] <- "90"
  data[data == "GE80"] <- "80"
  data[data == "GE50"] <- "50"
  glimpse(data)
  
  
  # Splits xy-xy into the midpoint single number
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
  data$ECD_RATE <- sapply(strsplit(data$ECD_RATE, split = "-"),
                          function(x) mean(as.numeric(x)))
  data$LEP_RATE <- sapply(strsplit(data$LEP_RATE, split = "-"),
                          function(x) mean(as.numeric(x)))
  
  data$YEAR <- year
  return(data)
}


# Adding another year of data

# data <- as.data.frame(Clean("EdFacts ----.csv", 2016))

data <- as.data.frame(Clean("EdFacts 2015.csv", 2015))

# 2014 data had an extra column. It didn't affect the function
data1 <- as.data.frame(Clean("EdFacts 2014.csv", 2014))
data1 <- select(data1, -28)

data2 <- as.data.frame(Clean("EdFacts 2013.csv", 2013))
data3 <- as.data.frame(Clean("EdFacts 2012.csv", 2012))
data4 <- as.data.frame(Clean("EdFacts 2011.csv", 2011))

# Bind the data together
df <- rbind(data, data1, data2, data3, data4)

# Write csv.
write.csv(df, "GraduationEdFacts.csv", row.names=FALSE)

