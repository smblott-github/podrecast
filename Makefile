
build:
	python setup.py build

install:
	$(MAKE) build
	sudo python setup.py install

dist:
	python setup.py sdist

clean:
	rm -fr build dist 

publish:
	python setup.py sdist upload

upload:
	$(MAKE) publish


.PHONY: build install dist clean publish upload
 
