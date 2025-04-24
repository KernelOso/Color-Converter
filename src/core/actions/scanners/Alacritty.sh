#!/usr/bin/env bash

function scanner() {
  local file="$1"
  local script_name="Alacritty"
  local format_name="Alacritty"
  log_message "$(get_message "executing_scanner") ${E_RESET}${script_name}" "index" 4 "${COLOR_STEP}" true
    
  if 
    grep -qE '^\s*\[colors\.primary\]' "$file" &&
    grep -qE '^\s*foreground\s*=' "$file" &&
    grep -qE '^\s*background\s*=' "$file" &&
    grep -qE '^\s*\[colors\.cursor\]' "$file" &&
    grep -qE '^\s*cursor\s*=' "$file" &&
    grep -qE '^\s*\[colors\.normal\]' "$file" &&
    grep -qE '^\s*black\s*=' "$file" &&
    grep -qE '^\s*red\s*=' "$file" &&
    grep -qE '^\s*green\s*=' "$file" &&
    grep -qE '^\s*yellow\s*=' "$file" &&
    grep -qE '^\s*blue\s*=' "$file" &&
    grep -qE '^\s*magenta\s*=' "$file" &&
    grep -qE '^\s*cyan\s*=' "$file" &&
    grep -qE '^\s*white\s*=' "$file" &&
    grep -qE '^\s*\[colors\.bright\]' "$file"
  then
    log_message "$(get_message "format_detected") ${E_RESET}${script_name}" "last" 5 "${COLOR_SUCCESS}" true
    echo "$format_name"
  fi
}