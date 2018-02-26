##install packages
install.packages("tidyverse")
install.packages("nycflights13")

## load libraries
library(tidyverse)
library(nycflights13)

## dataset for assignment
flights=flights



#a
flights %>% 
  filter(arr_delay>=120)

#b
flights %>% 
  filter(dest==c("IAH","HOU"))

#c
flights %>% 
  filter(carrier=="UA"|carrier=="AA"|carrier=="DL")

#d
flights %>% 
  filter(month=="7"|month=="8"|month=="9")

#e
flights %>% 
  filter(arr_delay>=120) %>% 
  filter(dep_delay<=0)

#f
flights %>% 
  filter(dep_delay>=60) %>% 
  filter(dep_delay-arr_delay>30)

#g
flights %>% 
  filter(dep_time<=600)

#h
flights %>% 
  arrange(dep_delay)
flights %>% 
  arrange(desc(dep_delay))

#i
flights %>% 
  arrange(desc(distance/air_time))
  
#j
flights %>% 
  arrange(desc(air_time))
flights %>% 
  arrange(air_time)

flights %>% 
  arrange(desc(distance))
flights %>% 
  arrange(distance)
  