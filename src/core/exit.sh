#!/usr/bin/env bash

function exit_code () {

  local exit_code=$1
  
  log_exiting "$(get_message "exiting_whit_code")${exit_code}" "$exit_code" 

  exit "$exit_code"
}