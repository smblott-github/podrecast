PodRecast
=========

PodRecast -- a podcast aggregator for post-processing then re-publishing podcasts

## Why?

For me, two reasons:

- Podcast loudness varies substantially across feeds.  Some can be too
  load, some too quiet.  And I don't want to have to fiddle with the
  volume for each new podcast.  [MP3Gain](http://mp3gain.sourceforge.net/) can
  be used to balance the loudness of MP3 files, making all podcasts sound
  equally loud.

- In the EU, there a rules governing the maximum volume which consumer
  devices, such as smart phones, can generate through headphones.  In a noisy
  environment (for me, that's when cycling) the mandated volume can be too
  low, particularly for spoken podcasts.  Again,
  [MP3Gain](http://mp3gain.sourceforge.net/) can be used to pre-boost the
  volume such that it can be listened to comfortably in both quiet and noisy
  environments.

## What?

PodRecast is a podcasts aggregator for:

- downloading podcasts to a local system,
- reprocessing with tools such as MP3Gain, and
- republishing them on a local network.

The functionality is as follows:

- Download feeds and podcasts to local storage.
- Podcasts, when downloaded, are initially given a name which is *not*
  republished (because of their file name suffix).
- Some local post-processing happens (typically, a cron job), and podcast files
  are renamed such that they may now be republished.
- PodRecast publishes *exactly* the original feed's rss XML, but with each
  enclosure's URL replaced with a local URL.

## How?

As of April 2014, this is a new project, with many rough edges.  I'll post
better instructions in due course.

If you're brave enough to figure it out on your own and have a go, then please
do let me know how you get on -- post an issue:

- There's a sample configuration file [here](https://github.com/smblott-github/podrecast/blob/master/sample/repodcast.conf).
- There's a sample post-processing scrip [here](https://github.com/smblott-github/podrecast/blob/master/script/podrecast_mp3gain).

My own `crontab` reads like:

    05 2,12,17,20,23 * * * chronic podrecast
    55 2,12,17,20,23 * * * chronic podrecast_mp3gain

(`chromic` is part of the [more utils](https://github.com/madx/moreutils)
package.  It simplifies crontabs and is well worth a look.

