test: setup .PHONY

setup: test/CLIunit.sh
	./test/CLIunit.sh ./test/tests.sh

clean:
	rm test/CLIunit.sh

test/CLIunit.sh:
	cd test && curl -L https://raw.github.com/jmervine/CLIunit/master/install.sh | bash -s local

.PHONY:

# vim: ft=make:
