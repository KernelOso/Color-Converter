#!/usr/bin/env bash

function get_out_directory () {

  # obtener el path del archivo original en caso de no usar --outdir
  # guardar el output en el mismo directorio
  local file_path="$1"
  local file_dir=""
  file_dir="$(dirname "$file")/"

  if $FLAG_OUT_DIR; then

    local out_dir="$OUT_DIR_ARG"

    # add "/" to the string
    if [[ ! "${out_dir: -1}" == "/" ]]; then
      out_dir="${out_dir}/"
    fi

    if [[ ! -e "$out_dir" ]]; then

      if $FLAG_MKDIR; then
        log_message "$(get_message "creating_dir") ${out_dir}" "index" 4 "${COLOR_STEP}" false
        mkdir -p "$out_dir"

        # TODO verify permises

        log_message "$(get_message "path_set_to") ${out_dir}" "index" 4 "${COLOR_STEP}" false
        echo "$out_dir"
      else
        log_message "$(get_message "unexisting_path") ${out_dir}" "index" 4 "${COLOR_ERROR}" false

        log_message "$(get_message "path_set_to") ${file_dir}" "index" 4 "${COLOR_STEP}" false
        echo "$file_dir"
      fi

    else
      log_message "$(get_message "path_set_to") ${out_dir}" "index" 4 "${COLOR_STEP}" false
      echo "$out_dir"
    fi

  else
    log_message "$(get_message "path_set_to") ${file_dir}" "index" 4 "${COLOR_STEP}" false
    echo "$file_dir"
  fi

}