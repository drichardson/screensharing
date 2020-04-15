# screensharing

Experimentation with ffmpeg and OBS to implement screen sharing.

## OBS Profiles

The *obs* directory contains profiles that can be imported into OBS. To use,
press *Start Recording*, NOT *Start Streaming*, since a custom recording has
been setup to use ffmpeg to publish the RTP streams.

## ffmpeg cheat cheat

ffmpeg -h full
ffmpeg -formats
ffmpeg -muxers
ffmpeg -codecs
ffmpeg -h encoder=libvpx-vp9
ffmpeg -h encoder=libx264
ffmpeg -h encoder=libx265


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


## Common 16:9 Resolutions

- 2560x1440
- 1920x1080
- 1280x720
