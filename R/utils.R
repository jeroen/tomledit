#' @export
print.Toml <- function(x, ...) {
  cat("<Toml>\n")
  dots <- list2(...)
  if (is.null(dots$format)) {
    cat(x$format(fmt = TRUE))
  } else {
    cat(x$format(fmt = FALSE))
  }
  invisible(x)
}

#' @export
as.character.Toml <- function(x, ...) {
  dots <- list2(...)
  if (is.null(dots$format)) {
    .catch(x$format_lines(fmt = TRUE))
  } else {
    .catch(x$format_lines(fmt = FALSE))
  }
}


# Catch an error condition returned by extendr
.catch <- function(cnd) {
  catch_cnd(
    {
      if (is_condition(cnd)) {
        cnd[["message"]] <- cnd[["value"]]
        cnd_signal(cnd)
      }
      cnd
    },
    "extendr_err"
  )
  cnd
}

# Ensure a list contains only named elements
check_list_named <- function(dots, call = rlang::caller_env()) {
  if (!rlang::is_named2(dots)) {
    rlang::abort(
      "All arguments provided to {.arg ...} must be named",
      call = call
    )
  }
  invisible(dots)
}
