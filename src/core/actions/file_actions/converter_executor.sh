#!/usr/bin/env bash

function exec_converters ( ) {

  local converters_dir="${SCRIPT_DIR}/core/actions/file_actions/converters/"
  local converter_script=""

  local out_dir="$1"
  shift
  local out_name="$1"
  shift
  local colors=("$@")

  log_message "$(get_message "executing_converters")" "index" 4 "${COLOR_ACTION}" true

  # flag --all
  load_all_formats "$converters_dir"

  # exit if not formats selected
  if [ ${#FLAG_FORMATS[@]} -eq 0 ]; then
    log_message "$(get_message "no_converters_to_execute")" "last" 5 "${COLOR_ERROR}" true
    return 1
  fi

  # load and execute
  for format in "${FLAG_FORMATS[@]}"; do
    converter_script="${converters_dir}${format}.sh"
    
    if [ -f "${converter_script}" ]; then
      source "${converter_script}"
      convert "$out_dir" "$out_name" ${colors[@]}
    fi
  done

  log_message "$(get_message "all_files_converted")" "last" 5 "${COLOR_SUCCESS}" true

}