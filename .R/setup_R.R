if (!require(pak, quietly = TRUE)) {
  install.packages(
    "pak",
    repos = c(CRAN = "https://packagemanager.posit.co/cran/latest")
  )
}

pak::pkg_install(scan("~/.R/user_R_packages.txt", what = "character"))
