#' World Population Dataset
#'
#'A dataset of the population of individual countries from 1950 - 2020
#'Sorted by geographical location/region. Each year is an individual column,
#'and each row is a country
#'
#' @format A data frame with 16685 observations with 3 columns.
#' \describe{
#'    \item{Country}{chr: name of the country}
#'    \item{Year}{int: Year of the observation from 1950 to 2020}
#'    \item{Population}{int: recorded population for the country that year (in thousands)}
#' }
"WorldPopulation"
