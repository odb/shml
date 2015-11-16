# By default 'bump' does nothing.
VERSION?=$(shell cat VERSION)

test: test/shunt.sh .PHONY
	./test/shunt.sh --verbose ./test/*_tests.sh

clean:
	-rm test/shunt.sh

test/shunt.sh:
	cd test && curl -L https://raw.githubusercontent.com/odb/shunt/latest/install.sh | bash -s latest local

BRANCH=master

docs-build:
	cd docs/ && jekyll build

docs-serve:
	cd docs/ && jekyll serve

docs-deploy:
	@git status | grep "working directory clean" || (echo "ERROR: You have uncommitted changes!"; git status; exit 1)
	git branch -D gh-pages
	git checkout -b gh-pages $(BRANCH)
	git rm -rf CHANGELOG.md CONTRIBUTING.md LICENSE Makefile README.md shml.sh test/ .travis.yml
	@for dir in $$(find docs -type d); do \
		mkdir -v -p $$(echo $$dir | sed 's/docs\///'); \
	done
	@for file in $$(find docs -type f); do \
		git mv --force -v $$file $$(echo $$file | sed 's/docs\///') || exit 1; \
	 done
	git add .
	git commit -m "Deploying Docs to gh-pages."
	git push origin gh-pages --force
	git checkout $(BRANCH)

# Usage: make bump VERSION=<new_version>
bump:
	# Updating $(shell cat VERSION) to $(VERSION)
	find . -type f | grep -v ".git\|CHANGELOG" | xargs grep -l $(shell cat VERSION) | xargs sed -i '' -e "s/$(shell cat VERSION)/$(VERSION)/g"

publish: publish/npm

publish/npm:
	npm publish


.PHONY:

# vim: ft=make:
