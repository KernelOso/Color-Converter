#!/usr/bin/env bash

function convert () {

  local file="$1"

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


  local output_dir=""
  output_dir="$(dirname "$file")/"

  local file_basename=""
  file_basename="${file##*/}"
  file_basename="${file_basename%.*}"


  local format="Termux"
  local output_sufix="-termux.properties"

  local output_file="${output_dir}${file_basename}${output_sufix}"
  

  log_message "$(get_message "executing_conversor") ${format}" "index" 5 "${COLOR_STEP}" true

  cat > "$output_file" <<EOF
color0=#$b_black
color1=#$b_red
color2=#$b_green
color3=#$b_yellow
color4=#$b_blue
color5=#$b_magenta
color6=#$b_cyan
color7=#$b_white
color8=#$l_black
color9=#$l_red
color10=#$l_green
color11=#$l_yellow
color12=#$l_blue
color13=#$l_magenta
color14=#$l_cyan
color15=#$l_white
background=#$background
foreground=#$foreground
cursor=#$cursor

EOF
  
  log_message "$(get_message "file_converted") ${output_file}" "last" 6 "${COLOR_STEP}" true

}