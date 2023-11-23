packages <- pak::pkg_list() |> 
  dplyr::mutate(
    package = dplyr::if_else(
      !is.na(remotepkgref),
      remotepkgref,
      package
    )
  ) |> 
  dplyr::pull(package)

packages |>
  pak::pkg_install()
