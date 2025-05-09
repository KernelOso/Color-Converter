#!/usr/bin/env bash

function scanner() {
  local file="$1"
  local script_name="Kitty"
  local format="kitty"
  log_message "$(get_message "executing_scanner") ${script_name}" "index" 4 "${COLOR_STEP}" true
    
  if 
    grep -qE '^\s*foreground' "$file" &&
    grep -qE '^\s*background' "$file" &&
    grep -qE '^\s*cursor' "$file" &&
    grep -qE '^\s*color0' "$file" &&
    grep -qE '^\s*color1' "$file" &&
    grep -qE '^\s*color2' "$file" &&
    grep -qE '^\s*color3' "$file" &&
    grep -qE '^\s*color4' "$file" &&
    grep -qE '^\s*color5' "$file" &&
    grep -qE '^\s*color6' "$file" &&
    grep -qE '^\s*color7' "$file" &&
    grep -qE '^\s*color8' "$file" &&
    grep -qE '^\s*color9' "$file" &&
    grep -qE '^\s*color10' "$file" &&
    grep -qE '^\s*color11' "$file" &&
    grep -qE '^\s*color12' "$file" &&
    grep -qE '^\s*color13' "$file" &&
    grep -qE '^\s*color14' "$file" &&
    grep -qE '^\s*color15' "$file"
  then
    log_message "$(get_message "format_detected") ${script_name}" "last" 5 "${COLOR_SUCCESS}" true
    echo "$format"
  fi
}
