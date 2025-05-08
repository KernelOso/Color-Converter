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

  local format="xresources"
  local output_sufix="-xresources.Xresources"

  local output_file="${out_dir}${out_name}${output_sufix}"

  log_message "$(get_message "executing_conversor") ${format}" "index" 5 "${COLOR_STEP}" true

  cat > "$output_file" <<EOF
! special
*.foreground:   #$foreground
*.background:   #$background
*.cursorColor:  #$cursor

! black
*.color0:       #$b_black
*.color8:       #$l_black

! red
*.color1:       #$b_red
*.color9:       #$l_red

! green
*.color2:       #$b_green
*.color10:      #$l_green

! yellow
*.color3:       #$b_yellow
*.color11:      #$l_yellow

! blue
*.color4:       #$b_blue
*.color12:      #$l_blue

! magenta
*.color5:       #$b_magenta
*.color13:      #$l_magenta

! cyan
*.color6:       #$b_cyan
*.color14:      #$l_cyan

! white
*.color7:       #$b_white
*.color15:      #$l_white

EOF
  
  log_message "$(get_message "file_converted") ${output_file}" "last" 6 "${COLOR_STEP}" true

}