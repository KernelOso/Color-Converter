#!/usr/bin/env bash

source "${SCRIPT_DIR}/core/actions/processes/SHOW.sh"

function exec_processes () {
  
  local process="${PROCESS_TYPE}"

  local process_dir="${SCRIPT_DIR}/core/actions/processes"

  if [[ "$process" == "" ]];
  then
    exit_code 0
  fi

  log_message "$(get_message "executing_process") ${PROCESS_TYPE}" "index" 1 "${COLOR_PROCESS}"

  case "$process" in 

    "FILE")
      #exec_FILE
      ;;

    "BADDIES")
      #exec_BADDIES
      ;;
    
    "SHOW")
      local process="${process_dir}/SHOW.sh"
      process
      ;;

  esac

}