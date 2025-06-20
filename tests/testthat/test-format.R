test_that("formatting works", {
  test_toml <- toml(
    a_long_array = c("a long array", "with enough values", "to test formatting", "that should be broken over multiple lines"),
    a_short_array = c("a short array", "that doesn't break" ),
  )
  expect_snapshot(
    to_toml(test_toml, format = FALSE)
  )

  expect_snapshot(
    to_toml(test_toml)
  )

  temp <- tempfile(fileext = ".toml")
  write_toml(test_toml, temp)
  expect_snapshot_file(temp, "formatted.toml")
})
