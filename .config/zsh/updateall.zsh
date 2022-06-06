updateall () {
	updatezsh
	brew upgrade
	mas upgrade
	Rscript -e 'update.packages(repos = "https://cran.rstudio.com/")'
	conda update conda
}