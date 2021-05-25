#!/bin/sh

wl-paste --type=image/png > ~/clipboard.png
python3.7 ~/img2tex.py "$@"
