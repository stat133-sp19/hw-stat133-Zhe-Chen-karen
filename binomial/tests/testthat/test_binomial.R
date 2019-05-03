context("Check main binomial functions")

test_that("bin_choose works with the correct input",{
  expect_equal(bin_choose(5, 2),10)
  expect_equal(bin_choose(5,1:3),c(5,10,10))
  expect_length(bin_choose(5, 2),1)
})
test_that("bin_choose fails with k larger than n",{
  expect_error(bin_choose(5, 6))
})

test_that("bin_probability works with the correct input", {
  expect_equal(bin_probability(2, 5, 0.5), 0.3125)
  expect_length(bin_probability(1:2, 5, 0.5), 2)
})
test_that("bin_probability fails with invalid inputs", {
  expect_error(bin_probability(6, 5, 0.5))
  expect_error(bin_probability(-1, 5, 0.5))
})

test_that("bin_distribution works with the correct input", {
  expect_is(bin_distribution(5,0.5),c("bindis","data.frame"))
  expect_length(bin_distribution(5,0.5)$success, 6)
})
test_that("bin_distribution fails with invalid input",{
  expect_error(bin_distribution(-5,0.5))
  expect_error(bin_distribution(trials = 5.5, prob = 0.5))
})

test_that("bin_cumulative works with the correct input", {
  expect_is(bin_cumulative(5,0.5),c("bincum","data.frame"))
  expect_length(bin_cumulative(5,0.5)$success,6)
  expect_equal(bin_cumulative(5,0.5)$probability, c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))
})
