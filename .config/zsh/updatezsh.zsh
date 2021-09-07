# Update themes and plugins
updatezsh () {
  omz update
  dir_array=(
    themes/powerlevel10k
    plugins/zsh-autosuggestions
    plugins/zsh-syntax-highlighting
  )
  for dir in "${dir_array[@]}"; do
    /usr/local/bin/git -C "${ZSH_CUSTOM}/${dir}" pull
  done
}
