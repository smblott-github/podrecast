
# Default CGI directory.  To choose another directory, use:
#
#    sudo make cgi=/PATH/TO/CGI/DIRECTORY install
#
cgi = /usr/lib/cgi-bin

install:
	$(MAKE) build
	sudo CGI_DIR=$(cgi) python setup.py install

build:
	python setup.py build

dist:
	python setup.py sdist

clean:
	rm -fr build dist 

.PHONY: install build dist clean
 
