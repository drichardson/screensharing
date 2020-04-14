#!/bin/bash

VIDEO_SIZE=2560x1440
#VIDEO_SIZE=1920x1080


# Display a rectangle around recorded region of screen
SHOW_REGION="-show_region 1"

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
	-c:v libx264 \
	-b:v 10M \
	-crf 10 \
	-g $GOP \
	-pix_fmt yuv420p \
	-preset ultrafast \
	-profile:v high \
	-tune zerolatency \
	-f rtp rtp://localhost:5555


