#!/bin/bash

SDP=$1
shift

if [[ -z $SDP ]]; then
	echo "Missing SDP input file."
	exit 1
fi

# zerolatency on the player really helps in the case of x265. In my experiment,
# it reduced latency from 4 seconds to 2 seconds.
ZERO_LATENCY="-tune zerolatency"

ffplay \
	-protocol_whitelist rtp,file,udp \
	-i "$SDP" \
	$ZERO_LATENCY \
