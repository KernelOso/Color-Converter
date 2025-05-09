#!/usr/bin/env bash

function get_out_basename () {

  local file_path="$1"
  local file_basename=""
  file_basename="$(basename "$file")"

  if $FLAG_OUT_NAME; then
    local out_name="$OUT_BASENAME_ARG"
    log_message "$(get_message "basename_set_to") ${out_name}" "index" 4 "${COLOR_STEP}" false
    echo "$out_name"
  else
    file_basename="${file_basename%.*}"
    log_message "$(get_message "basename_set_to") ${file_basename}" "index" 4 "${COLOR_STEP}" false
    echo "$file_basename"
  fi

}