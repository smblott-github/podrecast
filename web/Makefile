
include $(HOME)/.gnumake.mk

target += index.html
target += podrecast_mp3gain
target += podrecast_mp3gain.html
target += podrecast_simple
target += podrecast_simple.html
target += podrecast.conf.sample

build: $(target)
	@true

srv = smblott.org
www = public_html/podrecast/

install: build
	rsync -av --delete $(target) ../dist/*.tar.gz $(srv):$(www)

podrecast_mp3gain: ../script/podrecast_mp3gain
	install -v -m 0444 $< $@

podrecast_simple: ../script/podrecast_simple
	install -v -m 0444 $< $@

podrecast.conf.sample: ../sample/podrecast.conf.sample
	install -v -m 0444 $< $@

dist upload publish: build
	cd .. && $(MAKE) $@

%.html: %
	source-highlight -s sh < $< > $@

.PHONY: build install dist publish upload

