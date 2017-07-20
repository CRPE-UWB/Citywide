# ### PREP THE DATA
# Washington DC

rm(list=ls()) 

# Load packages
library(plyr)
# library(utils)
library(data.table)
## NOTE: need to restore old version of data.table (R was updated, and with it data.table, 
# but old R version still on CSDE TS)
options(datatable.old.bywithoutby=TRUE)
library(dtplyr)
# library(nlme)
library(dplyr)
library(tidyr)
library(gdata)


# Set state-specific objects
## data file
# setwd("/Users/lualt/OneDrive/Work/CRPE/City Wide/DC") # if on PC
setwd("/Users/Alton/OneDrive/Work/CRPE/City Wide/DC") # if on Mac 

# 2015-16 data -------------------------------------------------
data <- read.csv("DCTest.csv", na.strings = "-")

glimpse(data)

for(i in 1:15){
  if(class(data[,i]) == "factor")
    data[,i] <- as.character(data[,i])
}

unique(data$School.Year)

data[data == "2008-2009"] <- 2009
data[data == "2009-2010"] <- 2010
data[data == "2010-2011"] <- 2011
data[data == "2011-2012"] <- 2012
data[data == "2012-2013"] <- 2013
data[data == "2013-2014"] <- 2014

data[data == "n<10"] <- NA

data$School.Year <- as.numeric(data$School.Year)

data <- filter(data, tested.grade == "All Grades")

unique(data$subgroup)

data <- filter(data, subgroup == "All")

nameslist <- c("school_year", "school_id", "school_name", "Subgroup", "Grade", "Tested.Math",
               "BelowBasic.Math", "Basic.Math", "Prof.Math", "Adv.Math",
               "Tested.ELA", "BelowBasic.ELA", "Basic.ELA", "Prof.ELA",
               "Adv.ELA")

names(data) <- nameslist

data$Tested.ELA <- as.numeric(data$Tested.ELA)
data$Tested.Math <- as.numeric(data$Tested.Math)

names(data)
data$BelowPerc.Math <- data$BelowBasic.Math/data$Tested.Math
data$BaiscPerc.Math <- data$Basic.Math/data$Tested.Math
data$ProfPerc.Math <- data$Prof.Math/data$Tested.Math
data$AdvPerc.Math <- data$Adv.Math/data$Tested.Math
data$BelowPerc.ELA <- data$BelowBasic.ELA/data$Tested.ELA
data$BasicPerc.ELA <- data$Basic.ELA/data$Tested.ELA
data$ProfPerc.ELA <- data$Prof.ELA/data$Tested.ELA
data$AdvPerc.ELA <- data$Adv.ELA/data$Tested.ELA

data$ProfAdv.Math <- data$ProfPerc.Math + data$AdvPerc.Math
data$ProfAdv.ELA <- data$ProfPerc.ELA + data$AdvPerc.ELA

saveRDS(data, "DC.Performance.Rdata")

# Merge ---------------------------------------------------------------
data <- readRDS("DC.Performance.Rdata")

enroll <- read.csv("dcenrollment.csv")

glimpse(enroll)
glimpse(data)

unique(enroll$school_year)

for(i in 1:20){
  if(class(enroll[,i]) == "factor")
    enroll[,i] <- as.character(enroll[,i])
}

enroll[enroll == "2009-2010"] <- 2010
enroll[enroll == "2010-2011"] <- 2011
enroll[enroll == "2011-2012"] <- 2012
enroll[enroll == "2012-2013"] <- 2013
enroll[enroll == "2013-2014"] <- 2014
enroll[enroll == "2014-2015"] <- 2015

enroll$school_year <- as.numeric(enroll$school_year)
enroll <- select(enroll, -X)

data <- filter(data, school_year != 2009)
enroll <- filter(enroll, school_year != 2015)
unique(data$school_year)
unique(enroll$school_year)

df <- inner_join(data, enroll, by = c("school_year", "school_id"))
test <- anti_join(data, enroll, by = c("school_year", "school_id"))

saveRDS(df, "DC_Complete.Rdata")
