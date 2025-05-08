#!/usr/bin/env bash

function get_out_basename () {

  local file_path="$1"
  local file_basename=""
  file_basename="$(basename "$file")"

  if $FLAG_OUT_NAME; then
    local out_name="$OUT_BASENAME_ARG"
    echo "$out_name"
  else
    file_basename="${file_basename%.*}"
    echo "$file_basename"
  fi

}