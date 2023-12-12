## code to prepare WorldPopulation dataset
library(tidyverse)
library(dplyr)
library(readxl)
WorldPopulation <- read_excel("./data-raw/World_Population.xlsx",
                          sheet="ESTIMATES", range = "A17:BZ306") %>%
  filter(Type == "Country/Area") %>%
  select( starts_with("Region"), '1950':'2020')
colnames(WorldPopulation)[[1]] <- 'Country'
WorldPopulation <- WorldPopulation %>%
  pivot_longer('1950':'2020', names_to = "Year",
               values_to = "Population") %>%
  mutate(Year = as.integer(Year)) %>%
  mutate(Population = as.integer(Population))
#pivoted here because I dont want to deal with documenting 72 columns
usethis::use_data(WorldPopulation, overwrite = TRUE)
