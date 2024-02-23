updateall () {
	brew upgrade
	nix flake update --flake $HOME/.config/home-manager && home-manager switch
	mas upgrade
	antidote update --bundles
	# Rscript -e 'update.packages()'
	# conda update conda
}
