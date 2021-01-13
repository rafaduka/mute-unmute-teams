#!/bin/bash

# Install wmctrl and xdotool if it is missing.
#sudo apt-get install -y wmctrl
#sudo apt-get install -y xdotool

wmctrl -R teams && \
xdotool key --clearmodifiers ctrl+shift+M && \
xdotool windowminimize $(xdotool getactivewindow)
