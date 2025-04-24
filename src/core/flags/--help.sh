#!/usr/bin/env bash

function show_help ( ) {

  if $FLAG_HELP;
  then

    log_message "$(get_message "manual_title")" "index" 1 "${COLOR_INFO}" false

    manual_header
    while IFS= read -r line; do
      manual_prefix "$line"
    done <<< "$(get_message "manual_content")"
    manual_bottom

  fi


}