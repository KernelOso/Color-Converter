#!/usr/bin/env bash

function verify_if_empty() {

  local file="$1"

  log_message "$(get_message "verifying_if_file_empty")" "last" 4 "${COLOR_STEP}" true
  
  if [ -s "$file" ]; then
      log_message "$(get_message "file_not_empty")" "last" 5 "${COLOR_SUCCESS}" true 3
      return 0
  else
      log_message "$(get_message "EXIT_9")" "last" 5 "${COLOR_ERROR}" true
      return 9
  fi

}