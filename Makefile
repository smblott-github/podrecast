
default:
	@echo No default, read Makefile.

install:
	python setup.py install

test:
	python ./podrecast

cgi:
	REQUEST_METHOD=GET PATH_INFO=/Cycling/Velo-Cast HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast

index:
	REQUEST_METHOD=GET PATH_INFO=/ HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast

cgierror:
	REQUEST_METHOD=GET PATH_INFO=/Cycling/Velo-Cast/../../../../../x HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast
	REQUEST_METHOD=GET PATH_INFO=/Cycling/Velo-CastXX HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast

sdist:
	python setup.py sdist

.PHONY: default test cgi index cgierror install sdist
 
