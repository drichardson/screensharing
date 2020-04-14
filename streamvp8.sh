#!/bin/bash

VIDEO_SIZE=2560x1440
#VIDEO_SIZE=1920x1080

SCALED_WIDTH=1920


# Display a rectangle around recorded region of screen
#SHOW_REGION="-show_region 1"

FRAMERATE=5
KEYFRAME_INTERVAL=2
GOP=$((FRAMERATE*KEYFRAME_INTERVAL))

ffmpeg \
	-f gdigrab \
	$SHOW_REGION \
	-framerate $FRAMERATE \
	-offset_x 0  \
	-offset_y 0 \
	-video_size $VIDEO_SIZE  \
	-i desktop \
	\
	-filter:v "scale=$SCALED_WIDTH:-1" \
	-filter:v "format=yuv422p" \
	\
	-c:v libvpx \
	-b:v 10M \
	-crf 10 \
	-g $GOP \
	-f rtp rtp://localhost:5555

# -pix_fmt yuv422p \


