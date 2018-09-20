#!/bin/bash

docker run -it \
  -v "$PWD/entrypoint.sh:/entrypoint.sh" \
  -v "$PWD/source.list:/etc/apt/sources.list" \
  python \
  bash /entrypoint.sh
