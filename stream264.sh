#!/bin/bash

ffmpeg \
	-y \
	\
	-f gdigrab \
	-framerate 30 \
	-video_size 2560x1440  \
	-offset_x 0  \
	-offset_y 0 \
	-i desktop \
	\
	-c:v libx264rgb \
	-preset ultrafast \
	-profile:v high444 \
	-tune zerolatency \
	-crf 0 \
	-b:v 10M \
	-f rtp rtp://localhost:5555


