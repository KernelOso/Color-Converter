#!/usr/bin/env bash

function verify_data () {

  local colors=("$@")

  local background="$1"
  local foreground="$1"
  local cursor="$3"

  local b_black="$4"
  local b_red="$5"
  local b_green="$6"
  local b_yellow="$7"
  local b_blue="$8"
  local b_magenta="$9"
  local b_cyan="${10}"
  local b_white="${11}"

  local l_black="${12}"
  local l_red="${13}"
  local l_green="${14}"
  local l_yellow="${15}"
  local l_blue="${16}"
  local l_magenta="${17}"
  local l_cyan="${18}"
  local l_white="${19}"

  log_message "$(get_message "verifying_data")" "index" 3 "${COLOR_VERIFICATOR}" false

  if 
    [ -z "$background" ] || [ "$background" = "null" ] || \
    [ -z "$foreground" ] || [ "$foreground" = "null" ] || \
    [ -z "$cursor" ] || [ "$cursor" = "null" ] || \
    [ -z "$b_black" ] || [ "$b_black" = "null" ] || [ -z "$l_black" ] || [ "$l_black" = "null" ] || \
    [ -z "$b_red" ] || [ "$b_red" = "null" ] || [ -z "$l_red" ] || [ "$l_red" = "null" ] || \
    [ -z "$b_green" ] || [ "$b_green" = "null" ] || [ -z "$l_green" ] || [ "$l_green" = "null" ] || \
    [ -z "$b_yellow" ] || [ "$b_yellow" = "null" ] || [ -z "$l_yellow" ] || [ "$l_yellow" = "null" ] || \
    [ -z "$b_blue" ] || [ "$b_blue" = "null" ] || [ -z "$l_blue" ] || [ "$l_blue" = "null" ] || \
    [ -z "$b_magenta" ] || [ "$b_magenta" = "null" ] || [ -z "$l_magenta" ] || [ "$l_magenta" = "null" ] || \
    [ -z "$b_cyan" ] || [ "$b_cyan" = "null" ] || [ -z "$l_cyan" ] || [ "$l_cyan" = "null" ] || \
    [ -z "$b_white" ] || [ "$b_white" = "null" ] || [ -z "$l_white" ] || [ "$l_white" = "null" ]; 
  then
    return 12 # missing data
  else 
    return 0
  fi

}

function verify_data_whit_exit () {

  local colors=("$@")

  verify_data ${colors[@]}
  if [[ $? == 12 ]];
  then
    log_message "$(get_message "EXIT_12")" "last" 3 "${COLOR_ERROR}" true
    exit_code 12
  fi


}