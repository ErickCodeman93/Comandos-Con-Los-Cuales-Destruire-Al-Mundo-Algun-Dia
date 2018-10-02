#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

# apt-get install imagemagick

extension="jpg"
# extension="png"
now="IMAGEMAGICK"
#width="1100"

for image in ~/Downloads/img/img/servicios/*.jpg;
# for image in ~/Desktop/images/*.png;
do
	echo "$image <=> ${image%.*}$now.$extension"
    convert "$image" -gravity center -extent 1100x800 "${image%.*}$now.$extension"
	

	# Optional
	# rm "$image"
done;

# Cache
rm -rf /tmp/magick-*