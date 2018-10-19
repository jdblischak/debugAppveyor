context("test-error.R")

test_that("1984", {
  expect_equal(2 + 2, 5)
})

test_that("rename works", {
  d1 <- tempfile()
  d2 <- tempfile()
  dir.create(d1)
  file.create(file.path(d1, "file.txt"))
  d1_rel <- fs::path_rel(d1)
  d2_rel <- fs::path_rel(d2)
  file.rename(d1_rel, d2_rel)
  # browser()
})
