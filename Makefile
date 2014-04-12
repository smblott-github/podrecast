
.PHONY: test cgi install

test:
	python ./podrecast

cgi:
	PATH_INFO=/Cycling/Velo-Cast HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast

install:
	sudo install -vm 0555 podrecast script/podrecast_mp3gain /usr/local/bin
	sudo install -vm 0555 podrecast /usr/lib/cgi-bin
	# pretend to be lagacy CGI script "podcast"...
	sudo install -vm 0555 podrecast /usr/lib/cgi-bin/podcast

