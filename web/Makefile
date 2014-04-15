
include $(HOME)/.gnumake.mk

.PHONY: build install

target += index.html
target += podrecast_mp3gain
target += podrecast_simple
target += podrecast.conf.sample

build: $(target)
	@true

srv = smblott.org
www = public_html/podrecast/

install:
	$(MAKE) build
	rsync -av --delete $(target) ../dist/*.tar.gz $(srv):$(www)

podrecast_mp3gain: ../script/podrecast_mp3gain
	install -v -m 0444 $< $@

podrecast_simple: ../script/podrecast_simple
	install -v -m 0444 $< $@

podrecast.conf.sample: ../sample/podrecast.conf.sample
	install -v -m 0444 $< $@

# Notes to self.
#
# To publish a new release:
#   - make dist
#   - update web/index.ascii to point to new release
#     make install
#   - git commit
#   - in setup.py and podrecast, bump version numbers
#   - git commit
#

