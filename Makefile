# Building and deploying the package

# This file assumes that the user has bump2version installed:
# https://pypi.org/project/bump2version/

version := patch
ROOT_DIR := $(shell basename $(dir $(abspath $$PWD)))
BRANCH:= $(shell git rev-parse --symbolic-full-name --abbrev-ref HEAD)

all: clean test docs build check 

clean:
	- rm -r $(ROOT_DIR).Rcheck $(ROOT_DIR)*.tar.gz

docs: clean
	Rscript -e 'roxygen2::roxygenise("$(ROOT_DIR)")'

build: 
	R CMD build $(ROOT_DIR)

check: clean build
	R CMD check $(shell find . -maxdepth 1 -type f -name "$(ROOT_DIR)*.tar.gz")

install: check
	R CMD install $(shell find . -maxdepth 1 -type f -name "$(ROOT_DIR)*.tar.gz")

bump:
	git checkout $(BRANCH)
	git pull origin $(BRANCH)
	bumpversion $(version)
	git push origin $(BRANCH) --follow-tags

.PHONY=clean bump
