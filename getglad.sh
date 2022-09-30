#!/bin/bash

data=$(
  curl -X POST \
    --data 'language=c' \
    --data 'specification=gl' \
    --data 'api=gl=4.6' \
    --data 'profile=compatibility' \
    --data 'loader=on' \
    --write-out '%{redirect_url} ' \
    'https://glad.dav1d.de/generate'
)

read -r redirect_url < <(tail -n1 <<<"$data")
echo $redirect_url"./glad.zip" > gladurl.txt
curl -o "$PWD/lib/ff.zip" "$redirect_url./glad.zip"
