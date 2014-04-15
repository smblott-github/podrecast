
include $(HOME)/.gnumake.mk

target += index.html
target += podrecast_mp3gain
target += podrecast_simple
target += podrecast.conf.sample

build: $(target)
	@true

srv = smblott.org
www = public_html/podrecast/

install: build
	rsync -av --delete $(target) ../dist/*.tar.gz $(srv):$(www)

dist: build
	cd .. && $(MAKE) dist

podrecast_mp3gain: ../script/podrecast_mp3gain
	install -v -m 0444 $< $@

podrecast_simple: ../script/podrecast_simple
	install -v -m 0444 $< $@

podrecast.conf.sample: ../sample/podrecast.conf.sample
	install -v -m 0444 $< $@

dist upload publish: build
	cd .. && $(MAKE) $@

.PHONY: build install dist publish upload

# Notes to self.
#
# To publish a new release:
#   - make dist
#   - update web/index.ascii to point to new release
#     make install
#   - git commit
#   - git tag
#   - make publish
#   - in setup.py and podrecast, bump version numbers
#   - git commit
#

