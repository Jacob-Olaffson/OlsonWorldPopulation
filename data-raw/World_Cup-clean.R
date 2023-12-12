library(rvest)
library(tidyverse)
library(dplyr)
## code to prepare the dataset 'World_Cup'
#scrape the data from the web
World_Cup <-
  read_html('https://en.wikipedia.org/wiki/FIFA_World_Cup') %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table()
#clean out some unwanted stuff
World_Cup <- World_Cup %>%
  select('Year', 'Hosts', starts_with("Total"), 'Averageattendance') %>%
  slice(-1)
colnames(World_Cup) <- c('Year', 'Hosts', 'TotalAtttend', 'AvgAttend')
World_Cup <- World_Cup %>%
  mutate(TotalAtttend = str_remove_all(TotalAtttend, ",")) %>%
  mutate(AvgAttend = str_remove_all(AvgAttend, ",")) %>%
  mutate(TotalAtttend = as.integer(TotalAtttend)) %>%
  mutate(AvgAttend = as.double(AvgAttend)) %>%
  drop_na()

World_Cup <- slice(World_Cup, -1 * length(World_Cup$Year))
#account for multiple tournaments in one country
World_Cup <- World_Cup %>%
  mutate(WorldCup = str_remove_all(paste(Hosts, Year), " ")) %>%
  select(!Year:Hosts)

usethis::use_data(World_Cup, overwrite = TRUE)
