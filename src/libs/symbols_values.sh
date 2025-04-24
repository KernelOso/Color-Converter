#!/usr/bin/env bash

readonly SYMB_INDEX="├────"
readonly SYMB_LAST_INDEX="└────"
readonly SYMB_VER_BAR="│"

readonly SYMB_MANUAL_HEADER="╔════════════════════"
readonly SYMB_MANUAL_PREFIX="║"
readonly SYMB_MANUAL_BOTTOM="╚════════════════════"

readonly SYMB_TAB="     "

# dictionary symbols :
readonly SYMB_POINT="¤"
readonly SYMB_ERROR="✘"
readonly SYMB_SUCCESS="✔"
readonly SYMB_WARNING="⚠"
readonly SYMB_STEP="!"
readonly SYMB_ACTION="⌘"
readonly SYMB_INFO="ℹ"
readonly SYMB_EXIT="⚙"
readonly SYMB_PROCESS="☆"
readonly SYMB_FILE="🗋"

# PREFIX
readonly PREFIX_VERIFICATOR="${COLOR_VERIFICATOR} ${SYMB_POINT} : ${SYMB_WARNING} : "
readonly PREFIX_STEP="${COLOR_STEP} ${SYMB_POINT} : ${SYMB_STEP} : "
readonly PREFIX_ERROR="${COLOR_ERROR} ${SYMB_POINT} : ${SYMB_ERROR} : "
readonly PREFIX_SUCCESS="${COLOR_SUCCESS} ${SYMB_POINT} : ${SYMB_SUCCESS} : "
readonly PREFIX_ACTION="${COLOR_ACTION} ${SYMB_POINT} : ${SYMB_ACTION} :"
readonly PREFIX_INFO="${COLOR_INFO} ${SYMB_POINT} : ${SYMB_INFO} :"
readonly PREFIX_EXIT="${COLOR_W} ${SYMB_POINT} : ${SYMB_EXIT} :"
readonly PREFIX_PROCESS="${COLOR_PROCESS} ${SYMB_POINT} : ${SYMB_PROCESS} :"
readonly PREFIX_FILE="${COLOR_FILE} ${SYMB_POINT} : ${SYMB_FILE} :"




