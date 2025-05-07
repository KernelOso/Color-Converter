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


  local format="alacritty"
  local output_sufix="-alacritty.toml"

  local output_file="${output_dir}${file_basename}${output_sufix}"
  

  log_message "$(get_message "executing_conversor") ${format}" "index" 5 "${COLOR_STEP}" true

  cat > "$output_file" <<EOF
[colors.primary]
foreground  =       "#$foreground"
background  =       "#$background"

[colors.cursor]
cursor      =       "#$cursor"

[colors.normal]
black       =       "#$b_black"
red         =       "#$b_red"
green       =       "#$b_green"
yellow      =       "#$b_yellow"
blue        =       "#$b_blue"
magenta     =       "#$b_magenta"
cyan        =       "#$b_cyan"
white       =       "#$b_white"

[colors.bright]
black       =       "#$l_black"
red         =       "#$l_red"
green       =       "#$l_green"
yellow      =       "#$l_yellow"
blue        =       "#$l_blue"
magenta     =       "#$l_magenta"
cyan        =       "#$l_cyan"
white       =       "#$l_white"

EOF
  
  log_message "$(get_message "file_converted") ${output_file}" "last" 6 "${COLOR_STEP}" true

}