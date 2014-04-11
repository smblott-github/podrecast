
.PHONY: test cgi install install-test-podrecast.conf

test:
	python ./podrecast

cgi:
	PATH_INFO=/Podcasts/Cycling/Velo-Cast python ./podrecast

mp3:
	PATH_INFO=/Cycling/Velo-Cast/140225-01-Velocast_Productions.mp3 python ./podrecast

install:
	sudo install -vm 0555 podrecast script/podrecast_mp3gain /usr/local/bin
	sudo install -vm 0555 podrecast /usr/lib/cgi-bin
	# pretend to be lagacy CGI script "podcast"...
	sudo install -vm 0555 podrecast /usr/lib/cgi-bin/podcast

install-test-podrecast.conf:
	sudo install -vm 0444 ./sample/podrecast.conf /etc

