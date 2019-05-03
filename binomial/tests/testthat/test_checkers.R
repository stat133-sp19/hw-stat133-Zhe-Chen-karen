context("Check checkers")

test_that("check_prob works with valid input", {
  expect_true(check_prob(0.5))
  expect_length(check_prob(0.5),1)
})
test_that("check_prob fails with invalid input", {
  expect_error(check_prob(-0.5))
  expect_error(check_prob(2))
})


test_that("check_trials works with valid input", {
  expect_true(check_trials(3))
  expect_true(check_trials(10))
})
test_that("check_trials fails with invalid input", {
  expect_error(check_trials(2.1))
  expect_error(check_trials(-8))
})


test_that("check_success works with valid input",{
  expect_true(check_success(5, 10))
  expect_true(check_success(c(1,2,3), 8))
})
test_that("check_success fails with invalid input",{
  expect_error(check_success(6, 3))
  expect_error(check_success(2.6, 3))
  expect_error(check_success(-1, 4))
})
