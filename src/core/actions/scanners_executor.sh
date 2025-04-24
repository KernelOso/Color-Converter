#!/usr/bin/env bash

function exec_scanners() {

  local file="$1"

  local scanners_dir="${SCRIPT_DIR}/core/actions/scanners"
  local script_out=""

  log_message "$(get_message "executing_scanners")" "index" 3 "${COLOR_ACTION}" false

  # load and execute scanners
  for script in "$scanners_dir"/*.sh; 
  do
    source "$script"

    #nombre unico para evitar conflictos
    local funct_name=""
    funct_name="scanner_$(basename "$script" .sh)"
    eval "$funct_name() { scanner \"\$@\"; }"
    
    script_out="$("$funct_name" "$file")"
    if [[ ! "$script_out" == "" ]];
    then
      break
    fi

  done

  log_message "$(get_message "scanners_executed")" "last" 4 "${COLOR_SUCCESS}" true

  if [[ "$script_out" == "" ]];
  then
    log_message "$(get_message "EXIT_10")" "last" 5 "${COLOR_ERROR}" true
    return 10
  fi

  echo "$script_out"

}

function exec_scanners_whit_exit () {

  local file="$1"

  exec_scanners "$file"
  if [[ $? == 10 ]];
  then
    exit_code 10 
  fi

}