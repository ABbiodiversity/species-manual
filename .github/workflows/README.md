# Explaining what is happening here

## renv snapshot

We do this based on the DESCRIPTION file so that

- we keep track of dependencies
- cache packages when running gh actions

```R
## initialize when starting fresh
renv::init()

## periodically update
renv::snapshot(type="explicit")
```

## Install

The pdf version looks like a pain...
Which means, we have to do it by hand.

```R
Rscript -e 'bookdown::render_book("index.Rmd", quiet = TRUE)'
Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::pdf_book")'
Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::epub_book")'
Rscript -e 'bookdown::calibre("_book/ABMI-Species-Manual.epub", "mobi")'
```

For most cases, this is not too important.

## Links

I took inspiration from these actions and yaml files

- https://github.com/marketplace/actions/github-pages-action
- https://github.com/r-lib/actions/blob/master/examples/bookdown.yaml

