updateall () {
	updatezsh
	brew upgrade
	mas upgrade
	# nix flake update --flake $HOME/.config/home-manager && home-manager switch
	# Rscript -e 'update.packages()'
	# conda update conda
}