if(!require(pak, quietly = TRUE)){
  install.packages("pak", repos = c(PPM = "https://packagemanager.posit.co/cran/latest"))
}

pak::repo_add(gadenbuie = "https://gadenbuie.r-universe.dev")
pak::pkg_install(scan("~/.R/user_R_packages.txt", what = "character"))

reticulate::install_miniconda()
# Use `reticulate::conda_create(envname = "<name>", environment = "<path>")`
# to create other environments
