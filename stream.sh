#!/bin/bash

ffmpeg \
	-f gdigrab \
	-show_region 1 \
	-framerate 30  
	-video_size hd720 
	-offset_x 10  \
	-offset_y 20 \
	-i desktop \
	-f rtp rtp://localhost:5555

