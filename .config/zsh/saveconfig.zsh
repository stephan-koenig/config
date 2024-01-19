saveconfig () {
  brew bundle dump --force --file=~/.config/brew/Brewfile
  # Rscript "$HOME/.R/save_user_R_packages.R"
}
