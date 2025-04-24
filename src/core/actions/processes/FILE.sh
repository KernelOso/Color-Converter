#!/usr/bin/env bash

function process () {

  local file="${PROCESS_ARG}"
  
  # Exec : pre-process flags
    get_file "$file" PROCESS_ARG
    file="${PROCESS_ARG}"

  log_message "$(get_message "processing_file") ${file}" "index" 2 "${COLOR_FILE}"

  # verify file integriti
  verify_file_whit_exit "$file"

  # save file (color-scheme) name
  local file_basename=""
  file_basename=${file%.*}

  # exec scanners :
  local format=""
  format="$(exec_scanners_whit_exit "$file")"

  # extract colors :: execute file reader
  local colors=()
  verify_reader_whit_exit "$format"
  mapfile -t colors < <(exec_reader "$file" "$format")

  verify_data_whit_exit ${colors[@]}

  print_colors ${colors[@]}

  # ejecutar flags
  # TODO : ejecutar acciones.... ( convert / install)



  # exec : post-process flags
    remove_file "$file"

  exit_code 0

}