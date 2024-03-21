updateall () {
	brew upgrade
	# sudo -i nix upgrade-nix
	nix flake update --flake $HOME/.config/home-manager \
          && home-manager switch
	mas upgrade
	antidote update --bundles
	# Update extensions
	# op plugin run -- gh extension upgrade --all gh extension upgrade --all
	# quarto update tool chromium
	# quarto update tool tinytex
	# Rscript -e 'update.packages()'
	# conda update conda
}
