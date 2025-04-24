#!/usr/bin/env bash

function verify_if_can_be_accessed () {

  local file="$1"

  log_message "$(get_message "verifying_if_file_can_access")" "index" 4 "${COLOR_STEP}" true
  
  if [ -r "$file" ]; then
      log_message "$(get_message "file_access")" "last" 5 "${COLOR_SUCCESS}" true
      return 0
  else
      log_message "$(get_message "EXIT_8")" "last" 5 "${COLOR_ERROR}" true
      return 8
  fi

}