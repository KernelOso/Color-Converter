#!/usr/bin/env bash

function get_message ( ) {

  local key="$1"

  declare -n msg_set="messages"
  echo "${msg_set[$key]}"  

}