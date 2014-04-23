#!/usr/bin/env python

from distutils.core import setup

setup(name='podrecast',
      author='Stephen Blott',
      author_email='smblott+prc@gmail.com',
      url='http://podrecast.smblott.org/',
      version='1.0.3',
      license='MIT',
      description='A podcast aggregator for downloading, post-processing then re-publishing podcasts.',
      long_description=open('README.txt').read(),
      platforms=['Unix'],
      scripts=['podrecast', 'script/podrecast_mp3gain', 'script/podrecast_simple' ],
      data_files=[ ( 'etc', [ 'sample/podrecast.conf.sample' ] ) ],
      )

