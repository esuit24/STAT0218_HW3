stop_data <- read_csv("Desktop/Stat_Learn/Minneapolis_Police_Stop_Data.csv")


# May 25th 2020, George Floyd was murdered by MPD 
# Might be interesting to see how policing practices change before and after
# George Floyd 

# Hints: 
# Given the exact time for when the stop happened - right now a character
#if want to include time anywhere (continuous variable, pre/post George Floyd)
#load lubridate package

library(lubridate)
library(sf)
library(tidyverse)
library(rattle)
library(rpart)

stop_data <- stop_data %>%
  mutate(time = as_datetime(responseDate),
         year = year(time),
         month = month(time),
         day = day(time))

gf_date <- as.Date("2020-05-25")
stop_data <- stop_data %>%
  mutate(case = case_when(time <= gf_date ~ 0,
                          time > gf_date ~ 1))

before_gf <- stop_data %>%
  filter(case == 0) 
tree <- rpart(problem ~ race + gender, data = before_gf)




