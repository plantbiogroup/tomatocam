# Tomatocam

The Tomato Pi Cam is a stop action camera for observing slow
processes, such as plant growth.  It is built around the Raspberry Pi
2 B and it's camera module.

In its default setting it takes pictures every 10 minutes and stores
them on the filesystem.  Every hour am mp4 movie is made from the
pictures.

The movie is served out by a web server on the Tomato Pi, and can be
viewed in most modern browsers.

The Tomato Pi starts working as soon as you plug it in.

The Tomato Pi is designed to run without intervention.

# Hardware

Make yourself a Raspberry Pi with a cam module.  Install
Raspbian, and connect to your Tomato Pi.

The camera module on the Pi is a bit finicky to install.  Read up on
how to do it before you install it.

All the Tomato Pi functions are run with cron jobs.

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

###For sysytems that have ffmpeg:
```
sudo apt-get install ffmpeg
```

###For sysytems that have avconv:
```
sudo apt-get install libav-tools
```

Install ImageMagick for labeling the movies.
```
sudo apt-get install imagemagick
```


## Install tomatocam

```
sudo make install
```
