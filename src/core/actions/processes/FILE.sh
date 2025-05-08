#!/usr/bin/env bash

function process () {

  local file="${PROCESS_ARG}"
  
  # Exec : pre-process flags
    file="$(get_file "$file")"

  log_message "$(get_message "processing_file") ${file}" "index" 2 "${COLOR_FILE}"

  # verify file integrity
  verify_file_whit_exit "$file"

  # exec scanners :
  local format=""
  format="$(exec_scanners_whit_exit "$file")"

  # extract colors :: execute file reader
  local colors=()
  verify_reader_whit_exit "$format"
  mapfile -t colors < <(exec_reader "$file" "$format")

  # verify values
  verify_data_whit_exit ${colors[@]}

  # show colors on tui
  print_colors ${colors[@]}

  # exec file actions
  exec_file_actions "$file" ${colors[@]}

  # close lines
  log_close 2
  log_close 1

  # exec : post-process flags
    remove_file "$file"

  exit_code 0

}