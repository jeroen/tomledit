# formatting works

    Code
      to_toml(test_toml, format = FALSE)
    Output
      [1] "a_long_array = [\"a long array\", \"with enough values\", \"to test formatting\", \"that should be broken over multiple lines\"]\na_short_array = [\"a short array\", \"that doesn't break\"]\n"

---

    Code
      to_toml(test_toml)
    Output
      [1] "a_long_array = [\n  \"a long array\",\n  \"with enough values\",\n  \"to test formatting\",\n  \"that should be broken over multiple lines\",\n]\na_short_array = [\"a short array\", \"that doesn't break\"]\n"

---

    Code
      

