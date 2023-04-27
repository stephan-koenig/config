# Use Posit Package Manager specific to OS
repo <- switch(
  Sys.info()[["sysname"]],
  Linux = "https://packagemanager.rstudio.com/cran/__linux__/jammy/latest",
  "https://packagemanager.rstudio.com/cran/latest"
)
options(repos = c(CRAN = repo))
rm(repo)

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
Sys.setenv(PATH = paste("/usr/local/opt", Sys.getenv("PATH"), sep = ":"))
