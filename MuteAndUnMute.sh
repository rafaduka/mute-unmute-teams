#!/bin/bash
# Captura a descrição da janela do Teams
# Versão: 0.2
# Autor: Rafael Horácio
# Data: 13/01/2020


FILE=~/.teams-state-mute

# Get history from file, last state defined
read STATE < $FILE
sleep 0.1

# Sends alert popup to Linux
if [[ "mute" == $STATE ]]
then
    notify-send DEBUG $STATE
	echo "unmute" > $FILE
else
    notify-send DEBUG $STATE
	echo "mute" > $FILE
fi

# regex = .*\|\sMicrosoft\sTeams" = [<Descrição da Janela> | Microsoft Teams]
pid_win=`xdotool search --name ".*\|\sMicrosoft\sTeams"`

sleep 0.1
# Finds window Microsoft Teams
xdotool windowactivate $pid_win

# Sends shortcut Ctrl+Shit+M for toggle mute and unmute
sleep 0.1
xdotool key --clearmodifiers ctrl+shift+M

# if you want hide window after toggle shortcut
#xdotool windowminimize $(xdotool getactivewindow)