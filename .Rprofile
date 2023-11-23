# Use Posit Package Manager
options(repos = c(PPM = "https://packagemanager.posit.co/cran/latest"))

if (interactive()) {
  suppressMessages(require(devtools))
  suppressMessages(require(reprex))
  suppressMessages(require(styler))
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
