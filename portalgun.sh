#!/bin/bash

projectsInfo=()
path=path.txt

# read the file line by line and append each line to the array
while read line; do
    projectsInfo+=("$line")
done < "$path"

#empty the textfile

export GUM_INPUT_CURSOR_FOREGROUND="#FF0"
gum style \
	--foreground 212 --border-foreground 99 --border double \
	--align center --width 40 --margin "1 2" --padding "2 4" \
    'You are using Portal Gun' 'Aim your destination!'

dis=$(gum choose "🔫 Add current path" "❌ Cancel" $projectsInfo ) 

if [ "$dis" = "Add current path to portal gun" ]; then
    dis=none
    projectsInfo+=("$(pwd)")
    echo "$(pwd)" >> "$path"
elif [ "$dis" = "Cancel" ]; then
    dis=none
    return 1
fi


if [ "$dis" != "none" ]; then
    gum confirm 'Are you sure you wanna move?' && cd $dis
fi
# cd "/Users/natesbiglaptop/IdeaProjects"
# exec zsh

