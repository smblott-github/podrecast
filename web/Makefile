
include $(HOME)/.gnumake.mk

.PHONY: build install

target += index.html

build: $(target)
	@true

srv = smblott.org
www = public_html/podrecast/

install:
	$(MAKE) build
	rsync -av --delete $(target) $(srv):$(www)

