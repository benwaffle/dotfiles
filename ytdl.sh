#!/bin/bash

set -xeuo pipefail

if [ $(hostname) != "proton" ]; then
	scp $0 proton:
	exec ssh "proton" -- "bash -s" "$@" <$(basename $0)
fi

export PATH="~/.local/bin:$PATH"

yt-dlp --update

yt-dlp \
	--download-archive "archive.log" \
	-i \
	--add-metadata --all-subs --embed-subs --embed-thumbnail \
	--merge-output-format mkv \
	-o "/dump/media/clips/%(uploader)s - %(upload_date)s - %(title)s [%(id)s].%(ext)s" \
	$@
