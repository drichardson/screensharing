#!/bin/bash

SDP=$1
shift

if [[ -z $SDP ]]; then
	echo "Missing SDP input file."
	exit 1
fi

ffplay \
	-protocol_whitelist rtp,file,udp \
	-i "$SDP"
