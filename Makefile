
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
 
# Notes to self.
#
# To publish a new release:
#   - in setup.py and podrecast, bump version numbers
#   - make dist
#   - update web/index.ascii to point to new release
#   - make install
#   - make publish
#   - git commit
#   - git tag
#     gtag vX.Y.Z
#
# Bump version number before release.
#

