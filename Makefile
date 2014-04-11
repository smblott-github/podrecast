
.PHONY: test cgi install install-test-repodcast.conf

test:
	python ./repodcast

cgi:
	PATH_INFO=/Podcasts/Cycling/Velo-Cast python ./repodcast

mp3:
	PATH_INFO=/Cycling/Velo-Cast/140225-01-Velocast_Productions.mp3 python ./repodcast

install:
	sudo install -vm 0555 repodcast script/repodcast_mp3gain /usr/local/bin
	sudo install -vm 0555 repodcast /usr/lib/cgi-bin
	# pretend to be lagacy CGI script "podcast"...
	sudo install -vm 0555 repodcast /usr/lib/cgi-bin/podcast

install-test-repodcast.conf:
	sudo install -vm 0444 ./sample/repodcast.conf /etc

