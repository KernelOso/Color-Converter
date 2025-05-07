#!/usr/bin/env bash

function get_file () {

  local file="$1"
  local file_basename=""

  if $FLAG_GET; then

    log_message "$(get_message "getting_file") ${file}" "index" 2 "${COLOR_ACTION}" true

    status_code=$(curl -s -o /dev/null -w "%{http_code}" "$file")
    if [[ "$status_code" == 200 ]]; then

      # save file name
      file_basename=$(basename "$file")

      # download file
      curl -sSL -o "$file_basename" "$file"

      log_message "$(get_message "file_getted")" "last" 3 "${COLOR_SUCCESS}" true

      # return local file path
      echo "$file_basename"

    else 

      log_message "$(get_message "EXIT_6")" "last" 3 "${COLOR_ERROR}" true
      exit_code 6

    fi
    
  else

    echo "$file"

  fi
}