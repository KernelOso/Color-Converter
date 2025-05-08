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

  local format="linux"
  local output_sufix="-linuxTTY.sh"

  local output_file="${out_dir}${out_name}${output_sufix}"

  log_message "$(get_message "executing_conversor") ${format}" "index" 5 "${COLOR_STEP}" true

  cat > "$output_file" <<EOF
#!/bin/sh
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P0$b_black
  \e]P1$b_red
  \e]P2$b_green
  \e]P3$b_yellow
  \e]P4$b_blue
  \e]P5$b_magenta
  \e]P6$b_cyan
  \e]P7$b_white
  \e]P8$l_black
  \e]P9$l_red
  \e]PA$l_green
  \e]PB$l_yellow
  \e]PC$l_blue
  \e]PD$l_magenta
  \e]PE$l_cyan
  \e]PF$l_white
  "
  # get rid of artifacts
  clear
fi

EOF
  
  log_message "$(get_message "file_converted") ${output_file}" "last" 6 "${COLOR_STEP}" true

}