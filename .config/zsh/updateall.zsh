updateall () {
	updatezsh
	brew upgrade
	mas upgrade
	Rscript -e 'update.packages(repos = "https://packagemanager.rstudio.com/cran/latest")'
	conda update conda
}