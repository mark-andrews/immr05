main = slides
bibtex = mjandrews.bib

$(main).pdf: $(main).Rmd $(bibtex)
	Rscript -e "rmarkdown::render('$(main).Rmd')"
	
clean:
	rm -f $(main).log
	rm -f $(main).tex
	rm -rf $(main)_cache
	rm -rf $(main)_files

mrproper: clean
	rm -f $(main).pdf
	rm -f $(bibtex)

$(bibtex):
	wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/mark-andrews/bibtex/master/mjandrews.bib -O $(bibtex)

docker:
	docker build -t lmm_slides .
