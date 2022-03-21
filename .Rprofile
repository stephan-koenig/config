# # Use CRAN or corresponding RStudio Package Manager (RSPM) depending on OS
# repo <- switch(
#   Sys.info()[["sysname"]],
#   "Linux"   = "https://packagemanager.rstudio.com/all/__linux__/focal/latest",
#   "Windows" = "https://packagemanager.rstudio.com/all/latest",
#   "Darwin"  = "https://cran.rstudio.com/",
#   "https://cran.rstudio.com/"
# )
# options(repos = c(OS_REPO = repo))
# options(renv.config.repos.override = getOption("repos"))
# rm(repo)

if (interactive())  {
  suppressMessages(require(devtools))
  suppressMessages(require(reprex))
  suppressMessages(require(styler))
	suppressMessages(require(usethis))
	# thematic::thematic_on()
	options(
	  reprex.style         = TRUE,
	  rsthemes.theme_light = "base16 Unikitty Light {rsthemes}",
	  rsthemes.theme_dark  = "Night Owl {rsthemes}",
	  styler.cache_root = "styler"
	)
}

# # Use brew-installed compilers
# Sys.setenv(PATH = paste("/usr/local/opt", Sys.getenv("PATH"), sep = ":"))
