

serve-incremental :
	bundle exec jekyll serve --incremental

serve :
	bundle exec jekyll serve


clean:
	rm -rf _site
