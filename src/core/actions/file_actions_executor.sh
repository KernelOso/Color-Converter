#!/usr/bin/env bash

function exec_file_actions ( ) {

  local file="$1"
  shift
  local colors=("$@")

  log_message "$(get_message "executing_file_actions")" "index" 3 "${COLOR_ACTION}"

  if $FLAG_CONVERT; then 
    exec_converters "$file" ${colors[@]}
  fi

  log_message "$(get_message "all_file_actions_executed")" "last" 4 "${COLOR_SUCCESS}" false

}