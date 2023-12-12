#' Create a graph of a Country's Population
#'
#' Creates a ggplot graph object with a scatterplot of the specified
#' country's population from 1950 to 2020. Returns an error if the
#' country's name is not present in the WorldPopulation dataset.
#'
#' @param country String name of the desired country, defaults to USA
#' @return The created ggplot of 'country' population data
#' @examples
#' CountryPopulation()
#' plot <- CountryPopulation("Mexico")
#' @export

CountryPopulation <- function(country = "United States of America") {
  library(tidyverse)
  if(!(country %in% OlsonWorldPopulation::WorldPopulation$Country)) {
    stop("Country name not found")
  }
  grapher.man <- OlsonWorldPopulation::WorldPopulation %>%
    filter(Country == country) #%>%
    #pivot_longer('1950':'2020', names_to = "Year", values_to = "Population") %>%
   # mutate(Population = as.integer(Population)) %>%
    #mutate(Year = as.integer(Year))

  erm.ok.man <- ggplot(grapher.man, aes(x = Year, y = Population)) +
    geom_point() +
    scale_y_continuous(name = "Population (thousands)", breaks = waiver(), n.breaks = 10) +
    scale_x_continuous(breaks = seq(1950, 2020, by=5)) +
    theme(axis.text.x = element_text(angle = 90)) +
    labs(title = paste("Population of ", country))

  return(erm.ok.man)
}
#CountryPopulation()
#CountryPopulation("flarbgarb")
