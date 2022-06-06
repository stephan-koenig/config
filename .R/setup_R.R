if(!require(pak)) {
  install.packages("pak", repos = "https://cran.rstudio.com/")
}

pak::pkg_install(scan("~/.R/user_R_packages.txt", what = "character"))

reticulate::install_miniconda()
# Use `reticulate::conda_create(envname = "<name>", environment = "<path>")`
# to create other environments