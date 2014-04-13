#!/usr/bin/env python

import sys,os
from subprocess import call
from distutils.core import setup
from distutils.command.install import install as Install

# ####################################################################
# Custom installer...

class Installer(Install):
   cgi_dir = 'CGI_DIR'

   def run(self):
      Install.run(self)
      #
      cgi = self.find_cgi()
      if cgi and self.install_cgi(cgi):
         return
      else:
         print
         print "WARNING:"
         print "   Could not find the cgi directory."
         print "   Everything has been installed *except* for the cgi script."
         print "   Please install run 'make install' as follows"
         print
         print "      make cgi=/PATH/TO/CGI/DIRECTORY install"
         print
         sys.exit(1)

   def find_cgi(self):
      #
      if self.cgi_dir not in os.environ:
         print "{} is not set".format(self.cgi_dir)
         return None
      #
      cgi = os.environ[self.cgi_dir]
      if not os.path.isdir(cgi):
         print "directory does not exist:", cgi
         return None
      #
      return cgi

   def install_cgi(self,cgi):
      src = 'podrecast'
      dst = "{}/{}".format(cgi,src)
      print "choosing {} as the cgi directory".format(cgi)
      print "installing {} as {}".format(src,dst)
      if 0 == call("install -v -m 0555".split() + [src, dst]):
         print "cgi script installed successfully in", dst
         return True
      #
      print
      print "ERROR:"
      print "   Failed to install."
      return False

# ####################################################################
# Configuration...

setup(name='podrecast',
      author='Stephen Blott',
      author_email='smblott+prc@gmail.com',
      url='http://podrecast.smblott.org/',
      version='1.0.1',
      license='MIT',
      description='A podcast aggregator for downloading, post-processing then re-publishing podcasts.',
      long_description=open('README.txt').read(),
      platforms=['Unix'],
      scripts=['podrecast', 'script/podrecast_mp3gain', 'script/podrecast_simple' ],
      data_files=[ ( '/usr/local/etc', [ 'sample/podrecast.conf.sample' ] ) ],
      cmdclass={'install': Installer},
      )

