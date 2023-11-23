updateall () {
	updatezsh
	brew upgrade
	mas upgrade
	Rscript -e 'update.packages()'
	conda update conda
}