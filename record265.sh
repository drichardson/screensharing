#!/bin/bash

ffmpeg \
	-y \
	-f gdigrab \
	-show_region 1 \
	-framerate 30 \
	-video_size 2560x1440  \
	-offset_x 0  \
	-offset_y 0 \
	-i desktop \
	-c:v libx265 \
	-preset ultrafast \
	-profile:v high \
	-crf 0 \
	out.mkv

