#!/bin/sh

if [ -z "$1" ]
then
	echo "Specify file" 2>&1
	exit 1
fi

svgfile="$1"
psfile="$1".ps

set -e
flatpak run --filesystem=$(realpath .):rw org.inkscape.Inkscape --without-gui --file=$svgfile --export-filename=$psfile
flatpak run --filesystem=$(realpath .):rw org.inkscape.Inkscape --without-gui --file=$psfile --export-filename=$svgfile
rm $psfile
set +e

