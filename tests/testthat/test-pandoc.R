context("test-pandoc")

test_that("pandoc is installed", {
  expect_true(rmarkdown::pandoc_available())
  expect_identical(as.character(rmarkdown::pandoc_version()),
                   "1.19.1")
})
