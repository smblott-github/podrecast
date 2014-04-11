
.PHONY: test cgi install install-test-repodcast.conf

test:
	python ./repodcast

cgi:
	PATH_INFO=/Cycling/Velo-Cast python ./repodcast

install:
	sudo install -vm 0555 ./repodcast /ust/local/bin

install-test-repodcast.conf:
	sudo install -vm 0444 ./sample/repodcast.conf /etc

