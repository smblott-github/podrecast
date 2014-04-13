#!/usr/bin/env python

import sys,os
from distutils.core import setup

cgi  = []
cgis = [ '/usr/lib/cgi-bin', '/usr/lib/cgi', '/var/www/cgi-bin', '/var/www/cgi' ]

for directory in cgis:
   if os.path.isdir(directory):
      print 'choosing cgi directory', directory
      cgi = [ ( directory, [ 'podrecast' ] ) ]
      break

setup(name='podrecast',
      author='Stephen Blott',
      author_email='smblott+prc@gmail.com',
      url='http://podrecast.smblott.org/',
      version='1.0.0',
      license='MIT',
      description='A podcast aggregator for downloading, post-processing then re-publishing podcasts.',
      long_description=open('README.txt').read(),
      platforms=['Unix'],
      scripts=['podrecast', 'script/podrecast_mp3gain', 'script/podrecast_simple' ],
      data_files=[ ( '/usr/local/etc', [ 'sample/podrecast.conf.sample' ] ), ] + cgi,
      )

if 'install' in sys.argv:
   print
   if cgi:
      directory, [ scriptname ] = cgi[0]
      script = "{}/{}".format(directory,scriptname)
      print 'changing mode of {} to 0555'.format(script)
      os.chmod(script,0o555)
      print "CGI script successfully installed in", script
      print "please verify that this is the correct CGI directory"
   else:
      print "WARNING: Everything installed *except* for the cgi script."
      print "         Could not find the CGI directory."
      print "         Please install it (podrecast) manually."

