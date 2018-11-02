#!/bin/bash
weather=$(curl wttr.in | head -n 3 | tail -n 1 | xargs | awk '{print tolower($0)}' )

if [[ $weather =~ .*snow.* ]]
then

  #snow
  osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/dan/Pictures/snow.jpg"'

else

  if [[ $weather =~ .*rain.* ]]
  then

    # rain
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/dan/Pictures/rain.jpg"'

  else

    if (( $(($(date "+%H"))) > 7 && $(($(date "+%H"))) < 19 )); then

      # day
      osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/dan/Pictures/day.jpg"'

    else

      # night
      osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/dan/Pictures/night.jpg"'

    fi

  fi

fi
