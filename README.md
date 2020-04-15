# screensharing

Experimentation with ffmpeg and OBS to implement screen sharing on Windows.

The SDP files are configured to operate on localhost.


## Setup

1. Install [MSYS2](https://www.msys2.org/)
2. Start a MSYS2 MinGW 64-bit shell and run:

    ./setup.sh

## Usage

You can run the tests with or without OBS. The OBS full screen capture is MUCH
faster than the [gdigrab](https://ffmpeg.org/ffmpeg-devices.html#gdigrab)
capture device used by ffmpeg.

The most satisfactory results I got in terms of decent FPS and good visual
quality was running OBS with either nvenc 264 or 265.

### Without OBS:

    ./stream264.sh
    ./playsdp.sh stream264.sdp

### With OBS:

1. Install and use one of the OBS profiles
2. Press *Start Recording*
3. Run `./playsdp.sh` using the corresponding sdp file.


## OBS Profiles

The *obs* directory contains profiles that can be imported into OBS. To use,
press *Start Recording*, NOT *Start Streaming*, since a custom recording has
been setup to use ffmpeg to publish the RTP streams.

## ffmpeg cheat cheat

Commands for getting help and listing formats, codes, etc.

```
ffmpeg -h full
ffmpeg -formats
ffmpeg -muxers
ffmpeg -codecs
ffmpeg -h encoder=libvpx-vp9
ffmpeg -h encoder=libx264
ffmpeg -h encoder=libx265
```

- https://devblogs.nvidia.com/nvidia-ffmpeg-transcoding-guide/
- https://trac.ffmpeg.org/wiki/Encode/AV1
- https://trac.ffmpeg.org/wiki/Encode/H.264
- https://trac.ffmpeg.org/wiki/Encode/H.265
- https://trac.ffmpeg.org/wiki/Encode/VP8
- https://trac.ffmpeg.org/wiki/Encode/VP9
- https://www.ffmpeg.org/ffmpeg-codecs.html#libx264_002c-libx264rgb

### libx264rgb

libx264rgb is just like libx264, except it accepts RGB input instead of YUV,
which gets rid of colorspace conversion artifacts for screen recordings whose
source are in RGB.

If using a video camera (including webcams), libx264 would be better since they
usually use YUV, not RGB.

