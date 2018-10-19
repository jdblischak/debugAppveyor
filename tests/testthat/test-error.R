context("test-error.R")

test_that("Can create directory with absolute path", {
  d <- fs::path_norm(tempfile())
  dir.create(d, recursive = TRUE)
  expect_true(dir.exists(d))
})

test_that("Can create directory with relative path", {
  d <- fs::path_rel(tempfile())
  dir.create(d, recursive = TRUE)
  expect_true(dir.exists(d))
})

test_that("Can create directory with absolute path with for loop", {
  d <- fs::path_norm(c(tempfile(), tempfile(), tempfile()))
  for (i in seq_along(d)) {
    dir.create(d[i], recursive = TRUE)
  }
  expect_true(all(dir.exists(d)))
})

test_that("Can create directory with relative path with for loop", {
  d <- fs::path_rel(c(tempfile(), tempfile(), tempfile()))
  for (i in seq_along(d)) {
    dir.create(d[i], recursive = TRUE)
  }
  expect_true(all(dir.exists(d)))
})

test_that("Can create directory with absolute path with lapply", {
  d <- fs::path_norm(c(tempfile(), tempfile(), tempfile()))
  lapply(d, function(x) dir.create(x, recursive = TRUE))
  expect_true(all(dir.exists(d)))
})

test_that("Can create directory with relative path with lapply", {
  d <- fs::path_rel(c(tempfile(), tempfile(), tempfile()))
  lapply(d, function(x) dir.create(x, recursive = TRUE))
  expect_true(all(dir.exists(d)))
})

test_that("Can create directories", {
  newfile <- workflowr:::relative(tempfile("a/"))
  lapply(newfile, function(x) {
    dir.create(dirname(x), showWarnings = FALSE, recursive = TRUE)
  })
  expect_true(dir.exists(dirname(newfile)))

  multinewfile <- workflowr:::relative(c(tempfile("b/"),
                                         tempfile("b/"),
                                         tempfile("c/")))
  lapply(multinewfile, function(x) {
    dir.create(dirname(x), showWarnings = FALSE, recursive = TRUE)
  })
  expect_true(all(dir.exists(dirname(multinewfile))))

  nestednewfile <- workflowr:::relative(tempfile("a/b/c/"))
  lapply(nestednewfile, function(x) {
    dir.create(dirname(x), showWarnings = FALSE, recursive = TRUE)
  })
  expect_true(dir.exists(dirname(nestednewfile)))
})
