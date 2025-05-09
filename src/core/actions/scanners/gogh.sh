#!/usr/bin/env bash

function scanner() {
  local file="$1"
  local script_name="Gogh"
  local format="gogh"
  log_message "$(get_message "executing_scanner") ${script_name}" "index" 4 "${COLOR_STEP}" true
    
  if 
    grep -qE 'background:' "$file" &&
    grep -qE 'foreground:' "$file" &&
    grep -qE 'cursor:' "$file" &&
    grep -qE 'color_01:' "$file" &&
    grep -qE 'color_02:' "$file" &&
    grep -qE 'color_03:' "$file" &&
    grep -qE 'color_04:' "$file" &&
    grep -qE 'color_05:' "$file" &&
    grep -qE 'color_06:' "$file" &&
    grep -qE 'color_07:' "$file" &&
    grep -qE 'color_08:' "$file" &&
    grep -qE 'color_09:' "$file" &&
    grep -qE 'color_10:' "$file" &&
    grep -qE 'color_11:' "$file" &&
    grep -qE 'color_12:' "$file" &&
    grep -qE 'color_13:' "$file" &&
    grep -qE 'color_14:' "$file" &&
    grep -qE 'color_15:' "$file" &&
    grep -qE 'color_16:' "$file"
  then
    log_message "$(get_message "format_detected") ${script_name}" "last" 5 "${COLOR_SUCCESS}" true
    echo "$format"
  fi
}