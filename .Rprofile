globalCallingHandlers(error = rlang::entrace)

# Use Posit Package Manager
options(
  repos = c(CRAN = "https://p3m.dev/cran/latest"),
  warnPartialMatchArgs   = TRUE,
  warnPartialMatchDollar = TRUE,
  warnPartialMatchAttr   = TRUE,
  shiny.autoreload       = TRUE,
  shiny.launch.browser   = TRUE
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

# Use brew-installed compilers
# Sys.setenv(PATH = paste("/usr/local/opt", Sys.getenv("PATH"), sep = ":"))
