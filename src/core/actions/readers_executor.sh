#!/usr/bin/env bash

function exec_reader() {

  local file="$1"
  local format="$2"
  local script="${SCRIPT_DIR}/core/actions/readers/${format}.sh"

  source "$script"
  local funct_name=""
  funct_name="reader_$(basename "$script" .sh)"
  eval "$funct_name() { reader \"\$@\"; }"
  "$funct_name" "$file"

}

function verify_reader () {

  local format="$1"
  local readers_dir="${SCRIPT_DIR}/core/actions/readers"

  log_message "$(get_message "verifying_reader") ${format}.sh" "index" 3 "${COLOR_VERIFICATOR}" true

  local script="${readers_dir}/${format}.sh"
  if [ ! -f "$script" ]; then
    log_message "$(get_message "EXIT_11")" "last" 4 "${COLOR_ERROR}" true
    return 11
  fi

}

function verify_reader_whit_exit () {

  local format="$1"
  verify_reader "$format"
  local code=$?
  if [[ $code == 11 ]];
  then
    log_close 2
    log_close 1
    exit_code $code
  fi

}


