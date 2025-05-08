#!/usr/bin/env bash

function exec_file_actions ( ) {

  local file="$1"
  shift
  local colors=("$@")

  log_message "$(get_message "executing_file_actions")" "index" 3 "${COLOR_ACTION}"

  # get output directory
  local out_dir=""
  out_dir="$(get_out_directory "$file" )"

  # get output basename
  local out_basename=""
  out_basename="$(get_out_basename "$file")"

  # --convert flag
  if $FLAG_CONVERT; then 
    exec_converters "$out_dir" "$out_basename" ${colors[@]}
  fi

  log_message "$(get_message "all_file_actions_executed")" "last" 4 "${COLOR_SUCCESS}" false

}