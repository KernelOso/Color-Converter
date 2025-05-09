#!/usr/bin/env bash

function scanner() {
  local file="$1"
  local script_name="Oso's Base16"
  local format="oso"
  log_message "$(get_message "executing_scanner") ${script_name}" "index" 4 "${COLOR_STEP}" true
    
  if 
    grep -qE 'background:' "$file" &&
    grep -qE 'foreground:' "$file" &&
    grep -qE 'cursor:' "$file" &&
    grep -qE 'b_black:' "$file" &&
    grep -qE 'b_red:' "$file" &&
    grep -qE 'b_green:' "$file" &&
    grep -qE 'b_yellow:' "$file" &&
    grep -qE 'b_blue:' "$file" &&
    grep -qE 'b_magenta:' "$file" &&
    grep -qE 'b_cyan:' "$file" &&
    grep -qE 'b_white:' "$file" &&
    grep -qE 'l_black:' "$file" &&
    grep -qE 'l_red:' "$file" &&
    grep -qE 'l_green:' "$file" &&
    grep -qE 'l_yellow:' "$file" &&
    grep -qE 'l_blue:' "$file" &&
    grep -qE 'l_magenta:' "$file" &&
    grep -qE 'l_cyan:' "$file" &&
    grep -qE 'l_white:' "$file"
  then
    log_message "$(get_message "format_detected") ${script_name}" "last" 5 "${COLOR_SUCCESS}" true
    echo "$format"
  fi
}