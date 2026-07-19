#!/bin/bash
# Copy an image file to the Wayland clipboard as actual image data.
# Usage: img-to-clip <file>
# Then paste with Ctrl+V / SUPER+V anywhere that accepts images.
file="$1"
if [ ! -f "$file" ]; then
	echo "Usage: $0 <image-file>" >&2
	exit 1
fi
mime=$(file --mime-type -b "$file")
wl-copy --type "$mime" <"$file"
