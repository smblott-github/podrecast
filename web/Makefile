
include $(HOME)/.gnumake.mk

.PHONY: build install

target += index.html
target += ../script/podrecast_mp3gain
target += ../script/podrecast_simple
target += ../sample/podrecast.conf.sample

build: $(target)
	@true

srv = smblott.org
www = public_html/podrecast/

install:
	$(MAKE) build
	rsync -av --delete $(target) ../dist/*.tar.gz $(srv):$(www)

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

