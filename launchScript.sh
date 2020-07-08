#!/usr/bin/env bash

export PATH=$PWD/ffmpegBins:$PATH

# Generate assets
chmod +x ./ffmpegBins/ffmpeg
chmod +x $PWD/generateAsset.sh && $PWD/generateAsset.sh
# Start streaming in the background and show us it is doing the job
$PWD/ffmpegScripts/ffmpegLoopStream.sh $PWD/assets/deployedStream.mp4 24 2160 $SITE_ACCESS_KEY &
jobs
# Start PHP server
vendor/bin/heroku-php-apache2
