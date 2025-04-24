#!/usr/bin/env bash

function verify_if_file_exist () {

  local file="$1"

  log_message "$(get_message "verifying_if_file_exit")" "index" 4 "${COLOR_STEP}" true
  
  if [ -f "$file" ]; then

      log_message "$(get_message "file_exist")" "last" 5 "${COLOR_SUCCESS}" true
      return 0

  else

      log_message "$(get_message "EXIT_7")" "last" 5 "${COLOR_ERROR}" true
      return 7

  fi

}