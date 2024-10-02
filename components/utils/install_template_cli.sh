#!/bin/env bash
API_URL="https://api.github.com/repos/hiddewie/template/releases/latest"

curl -s $API_URL \
| grep "browser_download_url.*linux" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qNi - -O ~/.local/bin/template

chmod +x ~/.local/bin/template
