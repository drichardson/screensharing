#!/bin/bash

echo Running screen sharing experiment setup script.

echo Checking for MSYS2 MINGW64 environment
UNAME=$(uname -a)
echo "Detected system $UNAME"
echo $UNAME|grep MINGW64 > /dev/null
if [[ $? -ne 0 ]]; then

	cat <<-EOF
	This is not an MSYS2 MING64 shell.
	Install MSYS2, start the MING64 shell, and run this command.

	Download MSYS2 here:

	  https://www.msys2.org/

	For more information on MSYS2 package management with pacman, see:
	  https://www.msys2.org/wiki/MSYS2-introduction/
	  https://www.msys2.org/wiki/Using-packages/
	  https://wiki.archlinux.org/index.php/Pacman
	EOF
	exit 1
fi


set -e
pacman -Ss mingw-w64-x86_64-ffmpeg

echo Completed setup
