#!/usr/bin/env bash
# A not soo basic color-scheme reader – Bash script.
#
# Copyright (C) 2025 - github.com/KernelOso
#
# This project is licensed under the GNU General Public License v3.0.
# See the LICENSE file for details.

#Save the location of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/imports.sh"

function main () {

  clear

  local params=( "$@" )

  log_welcome

  #./core/script_treatment.sh
  load_parameters "${params[@]}"

  show_help

  verify_Dependencies

  exec_processes

}

main "$@"