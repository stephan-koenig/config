pak::pkg_list() |> 
  dplyr::mutate(
    package = dplyr::if_else(
      !is.na(remotepkgref),
      remotepkgref,
      package
    )
  ) |> 
  dplyr::pull(package) |>
  readr::write_lines(file = "~/.R/user_R_packages.txt")
