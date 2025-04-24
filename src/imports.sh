#!/usr/bin/env bash

#source "${SCRIPT_DIR}/libs/"
  source "${SCRIPT_DIR}/libs/colors_values.sh"
  source "${SCRIPT_DIR}/libs/parameter_values.sh"
  source "${SCRIPT_DIR}/libs/symbols_values.sh"

# language selection :
  source "${SCRIPT_DIR}/lang/languages/lang_${USER_LANG}.sh"

#source "${SCRIPT_DIR}/core/"
  source "${SCRIPT_DIR}/core/actions/processes_executor.sh"
  source "${SCRIPT_DIR}/core/actions/readers_executor.sh"
  source "${SCRIPT_DIR}/core/actions/scanners_executor.sh"

  source "${SCRIPT_DIR}/core/data_helpers/file_verifier/verifications/verify_access.sh"
  source "${SCRIPT_DIR}/core/data_helpers/file_verifier/verifications/verify_exist.sh"
  source "${SCRIPT_DIR}/core/data_helpers/file_verifier/verifications/verify_empty.sh"
  source "${SCRIPT_DIR}/core/data_helpers/file_verifier/verify_file.sh"
  source "${SCRIPT_DIR}/core/data_helpers/colors_printer.sh"
  source "${SCRIPT_DIR}/core/data_helpers/data_verifier.sh"

  source "${SCRIPT_DIR}/core/flags/--get.sh"
  source "${SCRIPT_DIR}/core/flags/--help.sh"
  source "${SCRIPT_DIR}/core/flags/--rm.sh"

  source "${SCRIPT_DIR}/core/script_treatment/dependencies.sh"
  source "${SCRIPT_DIR}/core/script_treatment/parameters.sh"

  source "${SCRIPT_DIR}/core/exit.sh"
  source "${SCRIPT_DIR}/core/log.sh"

#source "${SCRIPT_DIR}/lang/"
  source "${SCRIPT_DIR}/lang/language_getter.sh"
