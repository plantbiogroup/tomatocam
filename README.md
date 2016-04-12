# Tomatocam

The Tomato Pi Cam is a stop action camera for observing slow
processes, such as plant growth.  It is built around the Raspberry Pi
2 B and it's camera module.

In its default setting it takes pictures every 10 minutes and stores
them on the filesystem.  Every hour am mp4 movie is made from the
pictures.

The movie is served out by a web server on the Tomato Pi, and can be
viewed in most modern browsers.  You can see the movie if
you point your browser to http://<your Pi's IP address>/output.mp4.

The Tomato Pi starts working as soon as you plug it in.

The Tomato Pi is designed to run without intervention.

# Hardware

Make yourself a Raspberry Pi with a cam module.  Install
Raspbian, and connect to your Tomato Pi.

The camera module on the Pi is a bit finicky to install.  Read up on
how to do it before you install it.

You can adjust the focal distance on the camera by rotating
the screwing in or unscrewing the lens.

To set the focus to F cm, unscrew the lens D degrees where
```
D = 360 * (3.5 cm / F)
```
For more information see http://elinux.org/Rpi_Camera_Module

A nice and easy trick to set the focus is to put a ruler
from the lens outward slightly tilted towards the lens.
Take a picture by using
```
sudo cam
```
The focus is about where you can see the picture of the
ruler clearest.


# Configuration

All the Tomato Pi functions are run with cron jobs.  You can
find the cron jobs under /etc/cron.d.  By convention all
Tomatocam cron jobs end with the name 'part'.  Have a look
at
```
/etc/cron.d/campart.
```

To change the timing, edit the cron job files.  See
http://linux.die.net/man/5/crontab.

It may be wise to take some anti psychosis medication before
reading the manual.

All other parameters for the Tomatocam project are in the
file
```
/usr/local/bin/tomatocam.ini
```

The file format is standarde Python Config parser format.

Old pictures are cleaned out by a cron job after a certain size of
memory is consumed.  You can adjust the maximum memory consumption.
The default is 6 GB.

# Software

## Prerequisites

Update the system
```
sudo apt-get update
```

Install apache for serving out the movie
```
sudo install apache2
```

Install ffmpeg for making movies.  On some systems ffmpeg is called avconv.

###For systems that have ffmpeg:
```
sudo apt-get install ffmpeg
```

###For systems that have avconv:
```
sudo apt-get install libav-tools
```

Install ImageMagick for labeling the movies.
```
sudo apt-get install imagemagick
```


## Install tomatocam
Download this project to some directory.

Run

```
sudo make install
```

Behold.