#!/bin/bash
#"_       __ ______ __    ______ ____   __  ___ ______   __  ___ ____      ___     __  _    __ ___ 
#| |     / // ____// /   / ____// __ \ /  |/  // ____/  /  |/  // __ \    /   |   / / | |  / //   |
#| | /| / // __/  / /   / /    / / / // /|_/ // __/    / /|_/ // /_/ /   / /| |  / /  | | / // /| |
#| |/ |/ // /___ / /___/ /___ / /_/ // /  / // /___   / /  / // _, _/_  / ___ | / /___| |/ // ___ |
#|__/|__//_____//_____/\____/ \____//_/  /_//_____/  /_/  /_//_/ |_|(_)/_/  |_|/_____/|___//_/  |_|
#"

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