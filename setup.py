#!/usr/bin/env python

import sys, os, subprocess
from distutils.core import setup
from distutils.command.install import install as Install

# ####################################################################
# Custom installer...

class Installer(Install):
   env = [ 'PODRECAST_CGI_BIN', 'CGI_BIN' ]
   cgi = [ '/usr/lib/cgi-bin', '~/public_html/cgi-bin' ]

   def run(self):
      Install.run(self)
      for directory in [ os.environ[env] for env in self.env if env in os.environ ] + self.cgi:
         if self.cgi_install(directory):
            return
      print
      print 'Warning:'
      print '  CGI bin not found.'
      print '  CGI script (./podrecast) not installed; please install it by manually.'

   def cgi_install(self,directory):
      directory = os.path.expanduser(directory)
      if os.path.isdir(directory) and os.access(directory, os.W_OK):
         if 0 == subprocess.call('install -m 0555 podrecast'.split() + [ directory ]):
            print
            print 'Note:'
            print '  CGI script installed in', directory
            return True
      return False

# ####################################################################
# Configuration...

setup(name='podrecast',
      author='Stephen Blott',
      author_email='smblott+prc@gmail.com',
      url='http://podrecast.smblott.org/',
      version='1.1.3',
      license='MIT',
      description='A podcast aggregator for downloading, post-processing then re-publishing podcasts.',
      long_description=open('README.txt').read(),
      platforms=['Unix'],
      scripts=['podrecast', 'script/podrecast_mp3gain', 'script/podrecast_simple' ],
      data_files=[ ( 'etc', [ 'sample/podrecast.conf.sample' ] ) ],
      cmdclass={'install': Installer},
      )

