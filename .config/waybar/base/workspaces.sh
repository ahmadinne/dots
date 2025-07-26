#!/bin/bash

while true; do
  activeworkspace=$(hyprctl activeworkspace | grep "workspace ID" | awk '{print $3}')
  totalworkspaces=$(hyprctl workspaces | grep -c "workspace ID")

  echo "${activeworkspace}/${totalworkspaces}"
done
