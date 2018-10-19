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
  expect_true(dir.exists(d2_rel))
  expect_false(dir.exists(d1_rel))
})

test_that("wflow_rename works", {
  library(workflowr)
  start <- wflow_start(tempfile(), git = FALSE, change_wd = FALSE)
  tdir <- workflowr:::relative(start$directory)
  original <- file.path(tdir, "code")
  new <- file.path(tdir, "scripts")
  renamed <- wflow_rename(original, new, project = tdir)
  expect_false(dir.exists(original))
  expect_true(dir.exists(new))
  # browser()
})
