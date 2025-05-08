#!/usr/bin/env bash

function convert () {

  local out_dir="$1"
  shift
  local out_name="$1"
  shift
  local colors=("$@")

  local background="$1"
  local foreground="$2"
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

  local format="oso"
  local output_sufix="-oso.yaml"

  local output_file="${out_dir}${out_name}${output_sufix}"

  log_message "$(get_message "executing_conversor") ${format}" "index" 5 "${COLOR_STEP}" true

  cat > "$output_file" <<EOF
background: "$background"
foreground: "$foreground"
cursor:     "$cursor"

b_black:    "$b_black"
b_red:      "$b_red"
b_green:    "$b_green"
b_yellow:   "$b_yellow"
b_blue:     "$b_blue"
b_magenta:  "$b_magenta"
b_cyan:     "$b_cyan"
b_white:    "$b_white"

l_black:    "$l_black"
l_red:      "$l_red"
l_green:    "$l_green"
l_yellow:   "$l_yellow"
l_blue:     "$l_blue"
l_magenta:  "$l_magenta"
l_cyan:     "$l_cyan"
l_white:    "$l_white"

EOF
  
  log_message "$(get_message "file_converted") ${output_file}" "last" 6 "${COLOR_STEP}" true

}