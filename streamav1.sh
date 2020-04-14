#!/bin/bash

VIDEO_SIZE=2560x1440
#VIDEO_SIZE=1920x1080

SCALED_WIDTH=1920


# Display a rectangle around recorded region of screen
#SHOW_REGION="-show_region 1"

FRAMERATE=30
KEYFRAME_INTERVAL=2
GOP=$((FRAMERATE*KEYFRAME_INTERVAL))

ffmpeg \
	-y \
	\
	-f gdigrab \
	$SHOW_REGION \
	-framerate $FRAMERATE \
	-offset_x 0  \
	-offset_y 0 \
	-video_size $VIDEO_SIZE  \
	-i desktop \
	\
	-filter:v "scale=$SCALED_WIDTH:-1" \
	\
	-strict experimental \
	-c:v libaom-av1 \
	-b:v 0 \
	-crf 30 \
	-g $GOP \
	-f rtp rtp://localhost:5555


