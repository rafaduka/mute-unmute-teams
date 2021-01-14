#!/bin/bash
# Captura a descrição da janela do Teams
# regex = "(Alguma Descrição) | Microsoft Teams"

FILE=~/.teams-state-mute

read STATE < $FILE
sleep 0.1
if [[ "mute" == $STATE ]]
then
    notify-send DEBUG $STATE
	echo "unmute" > $FILE
else
    notify-send DEBUG $STATE
	echo "mute" > $FILE
fi

pid_win=`xdotool search --name ".*\|\sMicrosoft\sTeams"`
sleep 0.1
xdotool windowactivate $pid_win
sleep 0.1
xdotool key --clearmodifiers ctrl+shift+M
#xdotool windowminimize $(xdotool getactivewindow)