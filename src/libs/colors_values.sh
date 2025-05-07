#! /bin/bash/env bash

# ANSI Colors
readonly COLOR_R="\033[0;31m"  # Rojo
readonly COLOR_G="\033[0;32m"  # Verde
readonly COLOR_Y="\033[0;33m"  # Amarillo
readonly COLOR_B="\033[0;34m"  # Azul
readonly COLOR_M="\033[0;35m"  # Magenta
readonly COLOR_C="\033[0;36m"  # Cyan
readonly COLOR_W="\033[0;37m"  # Blanco
readonly E_RESET="\033[0m"     # Reset

# Color pallete
readonly COLOR_ROOT=$COLOR_R

# Especial colors
readonly COLOR_VERIFICATOR="$COLOR_Y"
readonly COLOR_STEP="$COLOR_B"
readonly COLOR_ERROR="$COLOR_R"
readonly COLOR_SUCCESS="$COLOR_G"
readonly COLOR_ACTION="$COLOR_M"
readonly COLOR_INFO="$COLOR_C"
readonly COLOR_EXIT="$COLOR_W"
readonly COLOR_PROCESS="$COLOR_C"
readonly COLOR_FILE="$COLOR_R"

# log level colors
C_LEVEL_0="${COLOR_ROOT}"
C_LEVEL_1=""
C_LEVEL_2=""
C_LEVEL_3=""
C_LEVEL_4=""
C_LEVEL_5=""
C_LEVEL_6=""

