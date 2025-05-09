#!/usr/bin/env bash

function process () {

  local file="${PROCESS_ARG}"

  local actual_file=""
  local code=""

  # reset triggers
  source "${SCRIPT_DIR}/libs/parameter_values.sh"

  # set, convert and all formats
  FLAG_CONVERT=true
  FLAG_ALL=true

  # iterate each sub directory
  for theme in ./*/; do

    # skip template directory
    if [ "$theme" == "./0_template/" ]; then
      continue
    fi

    #save actual file path
    actual_file="${theme}${file}"
    log_message "$(get_message "processing_file") ${actual_file}" "index" 2 "${COLOR_FILE}"

    # verify file integrity / skipping file
    verify_file "$actual_file"
    code=$?
    if [[ $code -gt 0 ]];
    then
      log_message "$(get_message "EXIT_${code}")" "index" 4 "${COLOR_VERIFICATOR}" false
      
      # skipping file....
      log_message "$(get_message "skipping_file")" "index" 4 "${COLOR_FILE}" false
      log_close 3
      log_close 2
      continue 
    fi

    # exec scanners
    local format="OsoB16"

    # extract colors
    local colors=()
    mapfile -t colors < <(exec_reader "$actual_file" "$format")

    # verify data
    verify_data ${colors[@]}
    code=$?
    if [[ $code == 11 ]];
    then
      log_message "$(get_message "EXIT_${code}")" "index" 4 "${COLOR_VERIFICATOR}" false
      
      # skipping file....
      log_message "$(get_message "skipping_file")" "index" 4 "${COLOR_FILE}" false
      continue 
    fi

    # show colors on tui
    print_colors ${colors[@]}

    # exec file actions
    exec_file_actions "$actual_file" ${colors[@]}

    # close line
    log_close 2
  done

  # close line
  log_close 1

  exit_code 0
}