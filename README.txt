PodRecast
---------

PodRecast is a podcast aggregator for downloading, post-processing then
re-publishing podcasts.

Here's my problem:

- I hate it when one podcast is loud, then the next is too quiet, then the
  next is *way* too loud.

- In the EU, there are rules governing the maximum output which consumer
  devices, such as smart phones, can generate through headphones.  In
  a noisy environment (for me, that's when cycling) the mandated volume can
  be too low, particularly for spoken podcasts.
  
Both of these problems can be addressed by downloading podcasts to
a server, post processing the files there (possibly with `mp3gain`), then
republishing them on a local network.

That's what PodRecast does.

More Information
----------------

.. _web page: http://podrecast.smblott.org/

See:

- the project `web page`_

Install
-------

Probably one of these:

   sudo python ./setup.py install

   python ./setup.py install --prefix=$HOME/local

But, there's more to it than this.  Please do read the project `web page`_ first.

