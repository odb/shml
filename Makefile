test: test/shunt.sh .PHONY
	./test/shunt.sh ./test/tests.sh

clean:
	rm test/shunt.sh

test/shunt.sh:
	cd test && curl -L https://raw.github.com/odb/shunt/master/install.sh | bash -s local

.PHONY:

# vim: ft=make:
