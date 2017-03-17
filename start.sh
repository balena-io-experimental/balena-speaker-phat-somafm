#!/bin/bash

# Play SomaFM
gst-launch-1.0 playbin uri=http://ice2.somafm.com/${CHANNEL=groovesalad-128-aac} \
  buffer-time=${BUFFER=300}
