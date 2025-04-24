#!/usr/bin/env bash

function print_colors () {

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

  # background 
  rBackground=$((16#${background:0:2}))
  gBackground=$((16#${background:2:2}))
  bBackground=$((16#${background:4:2}))

  # foreground
  rForeground=$((16#${foreground:0:2}))
  gForeground=$((16#${foreground:2:2}))
  bForeground=$((16#${foreground:4:2}))

  # Bold

  # bBlack
  rBBlack=$((16#${b_black:0:2}))
  gBBlack=$((16#${b_black:2:2}))
  bBBlack=$((16#${b_black:4:2}))

  # bRed
  rBRed=$((16#${b_red:0:2}))
  gBRed=$((16#${b_red:2:2}))
  bBRed=$((16#${b_red:4:2}))

  # bGreen
  rBGreen=$((16#${b_green:0:2}))
  gBGreen=$((16#${b_green:2:2}))
  bBGreen=$((16#${b_green:4:2}))

  # bYellow
  rBYellow=$((16#${b_yellow:0:2}))
  gBYellow=$((16#${b_yellow:2:2}))
  bBYellow=$((16#${b_yellow:4:2}))

  # bBlue
  rBBlue=$((16#${b_blue:0:2}))
  gBBlue=$((16#${b_blue:2:2}))
  bBBlue=$((16#${b_blue:4:2}))

  # bMagenta
  rBMagenta=$((16#${b_magenta:0:2}))
  gBMagenta=$((16#${b_magenta:2:2}))
  bBMagenta=$((16#${b_magenta:4:2}))

  # bCyan
  rBCyan=$((16#${b_cyan:0:2}))
  gBCyan=$((16#${b_cyan:2:2}))
  bBCyan=$((16#${b_cyan:4:2}))

  # bWhite
  rBWhite=$((16#${b_white:0:2}))
  gBWhite=$((16#${b_white:2:2}))
  bBWhite=$((16#${b_white:4:2}))

  # Light

  # lBlack
  rLBlack=$((16#${l_black:0:2}))
  gLBlack=$((16#${l_black:2:2}))
  bLBlack=$((16#${l_black:4:2}))

  # lRed
  rLRed=$((16#${l_red:0:2}))
  gLRed=$((16#${l_red:2:2}))
  bLRed=$((16#${l_red:4:2}))

  # lGreen
  rLGreen=$((16#${l_green:0:2}))
  gLGreen=$((16#${l_green:2:2}))
  bLGreen=$((16#${l_green:4:2}))

  # lYellow
  rLYellow=$((16#${l_yellow:0:2}))
  gLYellow=$((16#${l_yellow:2:2}))
  bLYellow=$((16#${l_yellow:4:2}))

  # lBlue
  rLBlue=$((16#${l_blue:0:2}))
  gLBlue=$((16#${l_blue:2:2}))
  bLBlue=$((16#${l_blue:4:2}))

  # lMagenta
  rLMagenta=$((16#${l_magenta:0:2}))
  gLMagenta=$((16#${l_magenta:2:2}))
  bLMagenta=$((16#${l_magenta:4:2}))

  # lCyan
  rLCyan=$((16#${l_cyan:0:2}))
  gLCyan=$((16#${l_cyan:2:2}))
  bLCyan=$((16#${l_cyan:4:2}))

  # lWhite
  rLWhite=$((16#${l_white:0:2}))
  gLWhite=$((16#${l_white:2:2}))
  bLWhite=$((16#${l_white:4:2}))

  log_message "$(get_message "colors_title")" "index" 3 "${COLOR_INFO}" false

  log_message " " "bar" 4 "" false
  log_message " ${E_RESET} Background : \e[48;2;${rBackground};${gBackground};${bBackground}m    ${E_RESET} | Foreground : \e[48;2;${rForeground};${gForeground};${bForeground}m    ${E_RESET}" "bar" 4 "" false
  log_message " " "bar" 4 "" false
  log_message " ${E_RESET} bBlack     : \e[48;2;${rBBlack};${gBBlack};${bBBlack}m    ${E_RESET} | lBlack     : \e[48;2;${rLBlack};${gLBlack};${bLBlack}m    ${E_RESET} " "bar" 4 "" false
  log_message " ${E_RESET} bRed       : \e[48;2;${rBRed};${gBRed};${bBRed}m    ${E_RESET} | lRed       : \e[48;2;${rLRed};${gLRed};${bLRed}m    ${E_RESET}" "bar" 4 "" false
  log_message " ${E_RESET} bGreen     : \e[48;2;${rBGreen};${gBGreen};${bBGreen}m    ${E_RESET} | lGreen     : \e[48;2;${rLGreen};${gLGreen};${bLGreen}m    ${E_RESET}" "bar" 4 "" false
  log_message " ${E_RESET} bYellow    : \e[48;2;${rBYellow};${gBYellow};${bBYellow}m    ${E_RESET} | lYellow    : \e[48;2;${rLYellow};${gLYellow};${bLYellow}m    ${E_RESET}" "bar" 4 "" false
  log_message " ${E_RESET} bBlue      : \e[48;2;${rBBlue};${gBBlue};${bBBlue}m    ${E_RESET} | lBlue      : \e[48;2;${rLBlue};${gLBlue};${bLBlue}m    ${E_RESET}" "bar" 4 "" false
  log_message " ${E_RESET} bMagenta   : \e[48;2;${rBMagenta};${gBMagenta};${bBMagenta}m    ${E_RESET} | lMagenta   : \e[48;2;${rLMagenta};${gLMagenta};${bLMagenta}m    ${E_RESET}" "bar" 4 "" false
  log_message " ${E_RESET} bCyan      : \e[48;2;${rBCyan};${gBCyan};${bBCyan}m    ${E_RESET} | lCyan      : \e[48;2;${rLCyan};${gLCyan};${bLCyan}m    ${E_RESET}" "bar" 4 "" false
  log_message " ${E_RESET} bWhite     : \e[48;2;${rBWhite};${gBWhite};${bBWhite}m    ${E_RESET} | lWhite     : \e[48;2;${rLWhite};${gLWhite};${bLWhite}m    ${E_RESET}" "bar" 4 "" false
  log_close 3

}