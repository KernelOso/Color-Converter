#!/usr/bin/env bash

function verify_Dependencies () {

  log_message "$(get_message "Verifying_dependencies")" "index" 1 "${COLOR_VERIFICATOR}"

  # Dependency : yq
  if ! command -v yq &> /dev/null; then

    log_message "$(get_message "EXIT_4")" "last" 2 "${COLOR_ERROR}" true
    exit_code 4

  fi 

  # Dependency : taplo
  if ! command taplo --version &> /dev/null; then

    log_message "$(get_message "EXIT_5")" "last" 2 "${COLOR_ERROR}" true
    exit_code 5
  fi 

}
