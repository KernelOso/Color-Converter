#!/usr/bin/env bash

function verify_file () {

  local file="$1"

  log_message "$(get_message "verifying_file") ${file}" "index" 3 "${COLOR_VERIFICATOR}" false

  # Exist?
  verify_if_file_exist "$file"
  if [[ $? == 7 ]];
  then
    return 7
  fi

  # Can be accessed?
  verify_if_can_be_accessed "$file"
  if [[ $? == 8 ]];
  then
    return 8
  fi

  # Is empty?
  verify_if_empty "$file"
  if [[ $? == 9 ]];
  then
    return 9
  fi

}

function verify_file_whit_exit () {

  local file="$1"

  verify_file "$file"
  if [[ $? -gt 0 ]];
  then
    exit_code $? 
  fi

}