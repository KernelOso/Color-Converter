#!/usr/bin/env bash

function exec_converters ( ) {

  local converters_dir="${SCRIPT_DIR}/core/actions/file_actions/converters/"
  local converter_script=""

  local file="$1"

  shift
  
  local colors=("$@")

  log_message "$(get_message "executing_converters")" "index" 4 "${COLOR_ACTION}" true

  # load all formats if --all
  local formatName=""
  if $FLAG_ALL; then

    for format in "$converters_dir"* ; do

      formatName=$(basename "$format")
      formatName="${formatName%.*}"
      FLAG_FORMATS+=("$formatName")

    done

  fi

  # stop function if format list is empty
  if [ ${#FLAG_FORMATS[@]} -eq 0 ]; then
    log_message "$(get_message "no_converters_to_execute")" "last" 5 "${COLOR_ERROR}" true
    return 1
  fi

  for format in "${FLAG_FORMATS[@]}"; do

    converter_script="${converters_dir}${format}.sh"

    if [ -f "${converter_script}" ]; then

      source "${converter_script}"
      convert "$file" ${colors[@]}

    fi

  done

  log_message "$(get_message "all_files_converted")" "last" 5 "${COLOR_SUCCESS}" true

}