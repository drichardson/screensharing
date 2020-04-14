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
	-c:v libx264 \
	-preset veryfast \
	out.mp4

