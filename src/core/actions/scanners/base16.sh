#!/usr/bin/env bash

function scanner() {
  local file="$1"
  local script_name="Base16"
  local format="base16"
  log_message "$(get_message "executing_scanner") ${script_name}" "index" 4 "${COLOR_STEP}" true
    
  if 
    grep -qE 'base00:' "$file" &&
    grep -qE 'base01:' "$file" &&
    grep -qE 'base02:' "$file" &&
    grep -qE 'base03:' "$file" &&
    grep -qE 'base04:' "$file" &&
    grep -qE 'base05:' "$file" &&
    grep -qE 'base06:' "$file" &&
    grep -qE 'base07:' "$file" &&
    grep -qE 'base08:' "$file" &&
    grep -qE 'base09:' "$file" &&
    grep -qE 'base0A:' "$file" &&
    grep -qE 'base0B:' "$file" &&
    grep -qE 'base0C:' "$file" &&
    grep -qE 'base0D:' "$file" &&
    grep -qE 'base0E:' "$file" &&
    grep -qE 'base0F:' "$file"
  then
    log_message "$(get_message "format_detected") ${script_name}" "last" 5 "${COLOR_SUCCESS}" true
    echo "$format"
  fi
}