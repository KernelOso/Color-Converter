#!/usr/bin/env bash

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
      local process="${process_dir}/FILE.sh"
      source "${process}"
      process
      ;;

    "BADDIES")
      #exec_BADDIES
      local process="${process_dir}/BADDIES.sh"
      source "${process}"
      process
      ;;
    
    "SHOW")
      local process="${process_dir}/SHOW.sh"
      source "${process}"
      process
      ;;

  esac

}