#!/usr/bin/env bash

function scanner() {
  local file="$1"
  local script_name="XResources"
  local format="xresources"
  log_message "$(get_message "executing_scanner") ${script_name}" "index" 4 "${COLOR_STEP}" true
    
  if 
    grep -q "^! special" "$file" &&
    grep -q "^\*\.foreground:" "$file" &&
    grep -q "^\*\.background:" "$file" &&
    grep -q "^\*\.cursorColor:" "$file" &&
  
    grep -q "^! black" "$file" &&
    grep -q "^\*\.color0:" "$file" &&
    grep -q "^\*\.color8:" "$file" &&
  
    grep -q "^! red" "$file" &&
    grep -q "^\*\.color1:" "$file" &&
    grep -q "^\*\.color9:" "$file" &&
  
    grep -q "^! green" "$file" &&
    grep -q "^\*\.color2:" "$file" &&
    grep -q "^\*\.color10:" "$file" &&
  
    grep -q "^! yellow" "$file" &&
    grep -q "^\*\.color3:" "$file" &&
    grep -q "^\*\.color11:" "$file" &&
  
    grep -q "^! blue" "$file" &&
    grep -q "^\*\.color4:" "$file" &&
    grep -q "^\*\.color12:" "$file" &&

    grep -q "^! magenta" "$file" &&
    grep -q "^\*\.color5:" "$file" &&
    grep -q "^\*\.color13:" "$file" &&

    grep -q "^! cyan" "$file" &&
    grep -q "^\*\.color6:" "$file" &&
    grep -q "^\*\.color14:" "$file" &&

    grep -q "^! white" "$file" &&
    grep -q "^\*\.color7:" "$file" &&
    grep -q "^\*\.color15:" "$file"
  then
    log_message "$(get_message "format_detected") ${script_name}" "last" 5 "${COLOR_SUCCESS}" true
    echo "$format"
  fi
}    
