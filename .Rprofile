if (require(rlang, quietly = TRUE)) {
  globalCallingHandlers(error = rlang::entrace)
}

# Use Posit Package Manager
options(
  repos = c(CRAN = "https://packagemanager.posit.co/cran/latest"),
  shiny.autoreload = TRUE,
  shiny.launch.browser = TRUE,
  warnPartialMatchArgs = TRUE,
  warnPartialMatchDollar = TRUE,
  warnPartialMatchAttr = TRUE
)

if (interactive()) {
  suppressMessages(require(devtools))
  suppressMessages(require(reprex))
  suppressMessages(require(styler))
  suppressMessages(require(testthat))
  suppressMessages(require(usethis))
  options(
    reprex.style = TRUE
  )
}
