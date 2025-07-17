if (require(rlang, quietly = TRUE)) {
  globalCallingHandlers(error = rlang::entrace)
}

# Use Posit Package Manager
options(
  repos = c(CRAN = "https://p3m.dev/cran/latest"),
  renv.config.pak.enabled = TRUE,
  renv.config.ppm.enabled = TRUE,
  renv.config.ppm.default = TRUE,
  renv.settings.ppm.enabled = TRUE,
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
    reprex.style         = TRUE,
    rsthemes.theme_light = "base16 Unikitty Light {rsthemes}",
    rsthemes.theme_dark  = "Night Owl {rsthemes}",
    styler.cache_root    = "styler-perm"
  )
}
