#!/usr/bin/env bash

USER_LANG="${LANG%%_*}"
#USER_LANG="es"

index=0
arg_position=0
for param  in "$@"; do
  ((index++))
    case "$param" in
      "--lang"|"-l")
        arg_position=$((index + 1))
        USER_LANG="${!arg_position}"
        ;;
    esac 
done

if [[ -f "${SCRIPT_DIR}/lang/languages/lang_${USER_LANG}.sh" ]];then
  source "${SCRIPT_DIR}/lang/languages/lang_${USER_LANG}.sh"
else 
  USER_LANG=en
  source "${SCRIPT_DIR}/lang/languages/lang_${USER_LANG}.sh"
fi