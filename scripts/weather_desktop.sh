#!/bin/bash
weather=$(curl wttr.in | head -n 3 | tail -n 1 | xargs | awk '{print tolower($0)}' )

newdesktop="/Users/dan/Pictures/"

if [[ $weather =~ .*snow.* ]] && [[ ! $weather =~ .*light.* ]]
then
  newdesktop+='snow'
else
  if [[ $weather =~ .*rain.* ]] && [[ ! $weather =~ .*light.* ]]
  then
    newdesktop+='rain'
  else
    if (( $(($(date "+%H"))) > 7 && $(($(date "+%H"))) < 19 )); then
      newdesktop+='day'
    else
      newdesktop+='night'
    fi
  fi
fi

newdesktop+=".jpg"

weathercmd='tell application "Finder" to set desktop picture to POSIX file "'
weathercmd+=$newdesktop
weathercmd+='"'

osascript -e "$weathercmd"
