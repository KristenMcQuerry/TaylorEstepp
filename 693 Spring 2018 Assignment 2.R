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
  group_by(hour) %>%
  summarise(avg_delay=mean(dep_delay,na.rm=T)) %>% 
  arrange(avg_delay)


##### 8
flights %>% 
  group_by(dest) %>% 
  summarise(total.delay=sum(dep_delay,na.rm=T))


#??
flights %>% 
  group_by(dest,carrier) %>% 
  summarise(total.delay=sum(dep_delay,na.rm=T)) %>% 
  arrange(carrier)


##### 9
#suspiciously fast
fast=flights %>% 
  #mutate(speed=distance/air_time) %>% 
  group_by(dest,origin) %>% 
  #mutate(avg_speed=mean(speed,na.rm=T)) %>% 
  mutate(avg_air=mean(air_time,na.rm=T)) %>% 
  #mutate(fast=speed/avg_speed) %>% 
  mutate(fast=air_time/avg_air) %>% 
  arrange(fast) %>% 
  #select(fast,speed,avg_speed,origin,dest,distance,carrier,flight,air_time)
  select(fast,air_time,avg_air,origin,dest,distance,carrier,flight)

  



#most delayed flights in the air
flights %>% 
  select(sched_dep_time,sched_arr_time,air_time,origin,dest,arr_delay,dep_delay) %>% 
  mutate(air_delay=arr_delay-dep_delay) %>% 
  arrange(desc(air_delay))

