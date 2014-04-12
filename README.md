PodRecast
=========

PodRecast -- a podcast aggregator for post-processing then re-publishing podcasts.

## Why?

For me, two reasons:

- Podcast loudness varies substantially across feeds.  Some can be too
  load, some too quiet.  And I don't want to fiddle with the
  volume for each new podcast.  Post-processing with
  [MP3Gain](http://mp3gain.sourceforge.net/) can balance the
  loudness of podcast files, making all podcasts sound equally loud.

- In the EU, there a rules governing the maximum volume which consumer
  devices, such as smart phones, can generate through headphones.  In a noisy
  environment (for me, that's when cycling) the mandated volume can be too
  low, particularly for spoken podcasts.  Again,
  [MP3Gain](http://mp3gain.sourceforge.net/) can be used to pre-boost the
  gain such that podcasts can be listened to comfortably in both quiet and noisy
  environments.

## What?

Key idea:

- republish podcasts, keeping the rss/xml exactly as it was, except replacing
  enclosure URLs with URLs referencing local, post-processed files.

The functionality is as follows:

- Download feeds and podcasts to local storage.

- Podcasts, when downloaded, are initially given a name which is *not*
  republished (they are given a distinctive suffix).

- Some local post-processing happens (typically, a cron job), and podcast files
  are renamed such that they may now be republished.  This is your
  responsibility.  After post-processing, rename the files, dropping the
  distinctive suffix).

- PodRecast, serving now as a CGI script, then publishes *exactly* the original feed's
  rss/XML, but with each enclosure's URL replaced with a local URL referencing
  a local, post-processed file.

## How?

As of April 2014, this is a new project, with many rough edges.  I'll post
better instructions in due course.

If you're brave enough to figure it out and have a go, then please
do let me know how you get on -- post an issue.

- Install `podrecast` in some suitable location, possibly `/usr/local/bin`.
- There's a sample configuration file [here](https://github.com/smblott-github/podrecast/blob/master/sample/repodcast.conf).  This should go, most likely, in `/etc/podrecast.conf`.
- And there's a sample post-processing script [here](https://github.com/smblott-github/podrecast/blob/master/script/podrecast_mp3gain); zsh required.

My own `crontab` reads like:

    05 2,12,17,20,23 * * * chronic podrecast -a
    55 2,12,17,20,23 * * * chronic podrecast_mp3gain

(`chronic` is part of the [more utils](https://joeyh.name/code/moreutils/)
package.  It simplifies crontabs and is well worth a look.)

`podrecast` is also a CGI script. Install it (also) in some suitable location
(such as `/usr/lib/cgi-bin`). Then:

- URLs such as `http://SERVER/cgi-bin/podrecast/Cycling/Velo-Cast` deliver the
  associated rss/xml feed, and
- URLs such as `http://SERVER/cgi-bin/podrecast/Cycling/Velo-Cast/SOME_FILE.mp3`
  deliver the associated podcast content.

#### Warning

Do not install `podrecast` as a CGI script on the public internet. It is *not* secure.
