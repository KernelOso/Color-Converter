#!/usr/bin/env bash

function get_file () {

  local file="$1"
  local file_basename=""
  declare -n ref=$2

  if $FLAG_GET; then

    log_message "$(get_message "getting_file") ${file}" "index" 2 "${COLOR_ACTION}" true


    status_code=$(curl -s -o /dev/null -w "%{http_code}" "$file")
    if [[ "$status_code" == 200 ]]; then

      # save file name
      file_basename=$(basename "$file")

      # download file
      curl -sSL -o "$file_basename" "$file"

      # save local file name y pointer
      ref="$file_basename"

      log_message "$(get_message "file_getted")" "last" 3 "${COLOR_SUCCESS}" true
    else 

      log_message "$(get_message "EXIT_6")" "last" 3 "${COLOR_ERROR}" true
      exit_code 6

    fi

  fi
}