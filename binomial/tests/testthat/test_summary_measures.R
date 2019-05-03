context("Check summary measures")

test_that("aux_mean works", {
  expect_equal(aux_mean(10, 0.1), 1)
  expect_equal(aux_mean(20, 0.2), 4)
  expect_type(aux_mean(11, 0.1), 'double')
  expect_length(aux_mean(10,0.1),1)
})

test_that("aux_variance works", {
  expect_equal(aux_variance(20, 0.2), 3.2)
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_type(aux_variance(10, 0.3), 'double')
  expect_length(aux_variance(10, 0.3), 1)
})

test_that("aux_mode works", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(5, 0.5), c(3, 2))
  expect_type(aux_mode(10, 0.3), 'integer')
  expect_length(aux_mode(10, 0.3),1)
})

test_that("aux_skewness works", {
  expect_equal(aux_skewness(10, 0.3), (1 - 2 * 0.3)/sqrt(10 * 0.3 * (1 - 0.3)))
  expect_equal(aux_skewness(10, 0.5), 0)
  expect_type(aux_skewness(10, 0.3), 'double')
  expect_length(aux_skewness(10, 0.3),1)
})

test_that("aux_kurtosis works", {
  expect_equal(aux_kurtosis(10, 0.3), (1 - 6 * 0.3 * (1 - 0.3))/(10 * 0.3 * (1 - 0.3)))
  expect_equal(aux_kurtosis(10, 0.5),-0.2)
  expect_type(aux_kurtosis(10, 0.3), 'double')
  expect_length(aux_kurtosis(10, 0.3), 1)
})
