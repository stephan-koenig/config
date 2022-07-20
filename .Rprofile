# # Use RStudio Package Manager (RSPM) specific to OS
# repo <- switch(
#   Sys.info()[["sysname"]],
#   "Linux"   = "https://packagemanager.rstudio.com/all/__linux__/focal/latest",
#   "https://packagemanager.rstudio.com/all/latest"
# )
# options(repos = c(RSPM = repo),
#         renv.config.repos.override = getOption("repos"),
#         renv.config.pak.enabled = TRUE)
# rm(repo)

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

# # Use brew-installed compilers
# Sys.setenv(PATH = paste("/usr/local/opt", Sys.getenv("PATH"), sep = ":"))
