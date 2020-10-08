#!/bin/bash

# Run this script to create and enter a ubuntu container preconfigured for linuxbrew
# It'll mount the tap into /taps/khanbrew and can be tapped in the container via:
# $ brew tap khan/repo /taps/khanbrew
#
# The linuxbrew download cache and taps are volume mounted into .linuxbrew on the host to reduce
# the "reset" time; but you'll still need to commit formula changes on the host and then run
# "brew update" in the container to fetch changes.
docker run -it \
    -v $(pwd)/.linuxbrew/cache:/home/linuxbrew/.cache/Homebrew \
    -v $(pwd)/.linuxbrew/taps:/home/linuxbrew/.linuxbrew/Homebrew/Library/Taps \
    -v $(pwd)/Formula:/taps/khanbrew/Formula \
    -v $(pwd)/.git:/taps/khanbrew/.git \
    --user linuxbrew \
    --net host \
    --hostname linuxbrew \
    homebrew/ubuntu20.04
