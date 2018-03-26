##install packages
install.packages("tidyverse")
install.packages("nycflights13")

## load libraries
library(tidyverse)
library(nycflights13)

## dataset for assignment
flights



##### 3
cancel.flights=flights %>% 
  group_by(month,day) %>% 
  summarise(avg_delay=mean(dep_delay,na.rm=T),cancel.prop=sum(is.na(air_time))/length(air_time))

anova(lm(avg_delay~cancel.prop,data=cancel.flights))


##### 4
delays=flights %>% 
  group_by(carrier) %>% 
  summarise(avg_delay=mean(dep_delay,na.rm=T)) %>% 
  arrange(avg_delay)

#challenge
flights %>% 
  group_by(carrier,dest) %>% 
  summarise(n())

anova(lm(dep_delay~carrier+origin,data=flights))


##### 5
flights %>%
  arrange(tailnum,month,day)


##### 6
flights %>% 
  group_by(tailnum) %>%
  summarise(avg_delay=mean(dep_delay,na.rm=T)) %>% 
  arrange(avg_delay)
  

##### 7
flights %>% 
  group_by(sched_dep_time) %>%
  summarise(avg_delay=mean(dep_delay,na.rm=T)) %>% 
  arrange(avg_delay)



