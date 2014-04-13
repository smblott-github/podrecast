
.PHONY: test cgi cgierror install

test:
	python ./podrecast

cgi:
	REQUEST_METHOD=GET PATH_INFO=/Cycling/Velo-Cast HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast

index:
	REQUEST_METHOD=GET PATH_INFO=/ HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast

cgierror:
	REQUEST_METHOD=GET PATH_INFO=/Cycling/Velo-Cast/../../../../../x HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast
	REQUEST_METHOD=GET PATH_INFO=/Cycling/Velo-CastXX HTTP_HOST=localhost SCRIPT_NAME=/cgi-bin/podrecast python ./podrecast

#
# WARNING!
# Don't run this install target blindly.  It works for me, but may not be
# suitable for all systems.
#
install:
	sudo install -vm 0555 podrecast script/podrecast_mp3gain script/podrecast_simple /usr/local/bin
	sudo install -vm 0555 podrecast /usr/lib/cgi-bin
	# pretend to be lagacy CGI script "podcast"...
	sudo install -vm 0555 podrecast /usr/lib/cgi-bin/podcast

