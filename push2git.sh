#!/bin/bash
# Checks if HASS config looks sane, then pushes it to git for backup.


cd /home/homeassistant/.homeassistant
source /srv/homeassistant/bin/activate
/srv/homeassistant/bin/hass --script check_config --config /home/homeassistant/.homeassistant


#  For next version, add condition: if secrets.yaml exists, and .gitignore has it too, then push.
git add .
git status
echo -n "Enter the Description for the Change: " [Minor Update]
read CHANGE_MSG
git commit -m "${CHANGE_MSG}"
git push origin master

exit
