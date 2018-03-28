#taylor estepp
#practicum assignment 2

##install packages
install.packages("tidyverse")
install.packages("nycflights13")

## load libraries
library(tidyverse)
library(nycflights13)

## dataset for assignment
flights



##### 3
#number of canceled flights per day
can=flights %>% 
  group_by(month,day) %>% 
  summarise(num_cancel=sum(is.na(air_time)))
#pattern
ggplot(can,aes(x=day,y=num_cancel,color=month))+
  geom_point()
#is proportion of cancelled flights related to the average delay
cancel.flights=flights %>% 
  group_by(month,day) %>% 
  summarise(avg_delay=mean(dep_delay,na.rm=T),cancel.prop=sum(is.na(air_time))/length(air_time))

anova(lm(avg_delay~cancel.prop,data=cancel.flights))
#cancel proportion related to avg delay


##### 4
#which carrier has worst delays
delays=flights %>% 
  group_by(carrier) %>% 
  summarise(avg_delay=mean(dep_delay,na.rm=T)) %>% 
  arrange(desc(avg_delay))

#challenge
flights %>% 
  group_by(carrier,dest) %>% 
  summarise(n())

anova(lm(dep_delay~carrier+origin,data=flights))


##### 5
#number of flights before first delay >60 NOT DONE
flights %>%
  arrange(tailnum,month,day) 
#i dont know how to iteratively add rows of a tibble until a condition is met
#or filter out all of the rows after a condition is met


##### 6
#tailnum with worst on time record
flights %>% 
  group_by(tailnum) %>%
  summarise(avg_delay=mean(dep_delay,na.rm=T)) %>% 
  arrange(desc(avg_delay))
  

##### 7
#what time should you fly to avoid delays
flights %>% 
  group_by(hour) %>%
  summarise(avg_delay=mean(dep_delay,na.rm=T)) %>% 
  arrange(avg_delay)


##### 8
#total minutes of delay per destination
flights %>% 
  group_by(dest) %>% 
  summarise(total.delay=sum(dep_delay,na.rm=T))
#compute prop of total delay for each row
flights %>% 
  group_by(dest) %>% 
  mutate(total.delay=sum(dep_delay,na.rm=T)) %>%
  mutate(delay_prop=abs(dep_delay/total.delay)) %>% 
  select(total.delay,carrier,dest,dep_delay,delay_prop) %>% 
  arrange(dest)
  


##### 9
#suspiciously fast
flights %>% 
  group_by(dest,origin) %>% 
  mutate(avg_air=mean(air_time,na.rm=T)) %>% 
  mutate(fast=air_time/avg_air) %>% 
  arrange(fast) %>% 
  select(fast,air_time,avg_air,origin,dest,distance,carrier)

#most delayed flights in the air
flights %>% 
  select(sched_dep_time,sched_arr_time,air_time,origin,dest,arr_delay,dep_delay,distance) %>% 
  mutate(air_delay=arr_delay-dep_delay) %>% 
  mutate(delay_dist=air_delay/distance) %>% #minutes per mile in the air lost
  arrange(desc(delay_dist))
#possibly values over 1 are error
