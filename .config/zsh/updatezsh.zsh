# Update themes and plugins
updatezsh () {
  "$ZSH/tools/upgrade.sh"

  # Update repos by providing array of directories
  # dir_array=(
  #  themes/powerlevel10k
  #  plugins/zsh-autosuggestions
  #  plugins/zsh-completions
  #  plugins/zsh-syntax-highlighting
  #)
  #for dir in "${dir_array[@]}"; do
  #  /usr/local/bin/git -C "${ZSH_CUSTOM}/${dir}" pull
  #done

  # Replace with antigen bundle and theme update
  antigen update 
}
