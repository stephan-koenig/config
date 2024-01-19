if(!require(pak, quietly = TRUE)){
  install.packages("pak", repos = c(PPM = "https://packagemanager.posit.co/cran/latest"))
}

pak::pkg_install(scan("~/.R/user_R_packages.txt", what = "character"))
