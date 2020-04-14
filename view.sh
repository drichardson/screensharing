#!/bin/bash

ffplay \
	-protocol_whitelist rtp,file,udp \
	-i test.sdp
