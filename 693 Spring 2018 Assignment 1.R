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
  filter(dest=="IAH"|dest=="HOU")
