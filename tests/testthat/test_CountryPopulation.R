library(testthat)
test_that('Invalid country name creates an error', {
  expect_error(OlsonWorldPopulation::CountryPopulation("Republic of Jacob"))
  expect_error(OlsonWorldPopulation::CountryPopulation("sdflaf"))
})

test_that('Valid country name creates no error', {
  expect_no_error(OlsonWorldPopulation::CountryPopulation())
  expect_no_error(OlsonWorldPopulation::CountryPopulation("India"))
})
