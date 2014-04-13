
default:
	@echo No default. Read the Makefile.

run:
	python ./podrecast

cgi:
	REQUEST_METHOD=GET PATH_INFO=/Cycling/Velo-Cast HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast

index:
	REQUEST_METHOD=GET PATH_INFO=/ HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast

install:
	python setup.py install

build:
	python setup.py build

dist:
	python setup.py sdist

.PHONY: default run cgi index install build dist
 
