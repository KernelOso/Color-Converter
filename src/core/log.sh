#!/usr/bin/env bash


function log_welcome ( ) {

cat <<EOF
$(printf "
${C_LEVEL_0} _______       __                   _______                                        
|   _   .-----|  .-----.----.______|   _   .----.-----.----.-----.-----.-----.----.
|.  1___|  _  |  |  _  |   _|______|.  1   |   _|  _  |  __|  -__|__ --|  _  |   _|
|.  |___|_____|__|_____|__|        |.  ____|__| |_____|____|_____|_____|_____|__|  
|:  1   |                          |:  |                                           
|::.. . |                          |::.|                                           
\`-------'                          \`---'  ${E_RESET} 
") 
EOF
echo -e "${C_LEVEL_0}¤ / $E_RESET"
  
}

function log_close () {

  local level=$1
  ((level++))

  log_message " " "last" $level "" false

}

function log_message () {

  local message="$1"
  shift
  local type="$1"
  shift
  local symbol=""
  local level=$1
  shift
  local level_color="$1"
  shift
  local is_a_debug_message=$1 # boolean
  shift
  local prefix=""
  local disabled_levels=("$@")

  local level0="${C_LEVEL_0}${SYMB_VER_BAR}${SYMB_TAB}"
  local level1="${C_LEVEL_1}${SYMB_VER_BAR}${SYMB_TAB}"
  local level2="${C_LEVEL_2}${SYMB_VER_BAR}${SYMB_TAB}"
  local level3="${C_LEVEL_3}${SYMB_VER_BAR}${SYMB_TAB}"
  local level4="${C_LEVEL_4}${SYMB_VER_BAR}${SYMB_TAB}"
  local level5="${C_LEVEL_5}${SYMB_VER_BAR}${SYMB_TAB}"
  local level6="${C_LEVEL_6}${SYMB_VER_BAR}${SYMB_TAB}"

  # treat : empty color
  if [[ "$level_color" == "" ]];
  then

    case $level in

      0)
      level_color="${C_LEVEL_0}"
      ;;

      1)
      level_color="${C_LEVEL_1}"
      ;;

      2)
      level_color="${C_LEVEL_2}"
      ;;

      3)
      level_color="${C_LEVEL_3}"
      ;;

      4)
      level_color="${C_LEVEL_4}"
      ;;

      5)
      level_color="${C_LEVEL_5}"
      ;;

      6)
      level_color="${C_LEVEL_6}"
      ;;

    esac

  fi

  # treat : empty debug trigger
  if [ "$is_a_debug_message" == "" ]; 
  then
    is_a_debug_message=false
  fi

  # treat : empty list
  if [[ ${#disabled_levels[@]} -eq 0 ]]; 
  then
    disabled_levels=(-1)
  fi


  for diabled_lvl in "${disabled_levels[@]}"; 
  do

    case $diabled_lvl in

      0)
      level0=" ${SYMB_TAB}"
      ;;

      1)
      level1=" ${SYMB_TAB}"
      ;;

      2)
      level2=" ${SYMB_TAB}"
      ;;

      3)
      level3=" ${SYMB_TAB}"
      ;;

      4)
      level4=" ${SYMB_TAB}"
      ;;

      5)
      level5=" ${SYMB_TAB}"
      ;;

      6)
      level6=" ${SYMB_TAB}"
      ;;

    esac

  done


  # define symbol type
  case $type in

    "index")
      symbol="$SYMB_INDEX"
    ;;

    "last")
      symbol="$SYMB_LAST_INDEX"
    ;;

    "bar")
      symbol="$SYMB_VER_BAR"
    ;;

  esac

  # load message prefix and color of level
  case $level in 

    1)
      C_LEVEL_1="$level_color"
      prefix="${C_LEVEL_0}${symbol}${C_LEVEL_1}"
    ;;

    2)
      C_LEVEL_2="$level_color"
      prefix="${level0}${C_LEVEL_1}${symbol}${C_LEVEL_2}"
    ;;

    3)
      C_LEVEL_3="$level_color"
      prefix="${level0}${level1}${C_LEVEL_2}${symbol}${C_LEVEL_3}"
    ;;

    4)
      C_LEVEL_4="$level_color"
      prefix="${level0}${level1}${level2}${C_LEVEL_3}${symbol}${C_LEVEL_4}"
    ;;

    5)
      C_LEVEL_5="$level_color"
      prefix="${level0}${level1}${level2}${level3}${C_LEVEL_4}${symbol}${C_LEVEL_5}"
    ;;

    6)
      C_LEVEL_6="$level_color"
      prefix="${level0}${level1}${level2}${level3}${level4}${C_LEVEL_5}${symbol}${C_LEVEL_6}"
    ;;

  esac

  if $is_a_debug_message; 
  then

    if $FLAG_DEBUG; 
    then

      echo -e "${prefix}${message}" >&2

    fi

  else

    echo -e "${prefix}${message}" >&2

  fi

}



#oooooooooooo              o8o      .        oooo                       
#`888'     `8              `"'    .o8        `888                       
# 888         oooo    ooo oooo  .o888oo       888   .ooooo.   .oooooooo 
# 888oooo8     `88b..8P'  `888    888         888  d88' `88b 888' `88b  
# 888    "       Y888'     888    888         888  888   888 888   888  
# 888       o  .o8"'88b    888    888 .       888  888   888 `88bod8P'  
#o888ooooood8 o88'   888o o888o   "888"      o888o `Y8bod8P' `8oooooo.  
#                                                            d"     YD  
#                                                            "Y88888P'  
function log_exiting () {

  local message="$1"

  local exit_code="$2"

  local exit_message=""
  exit_message=$(get_message "EXIT_${exit_code}")

  log_message "$message" "last" 1 "${COLOR_EXIT}" false
  log_message "$exit_message" "last" 2 "${COLOR_EXIT}" false 0

}


                                           

#ooooo   ooooo           oooo                  
#`888'   `888'           `888                  
# 888     888   .ooooo.   888  oo.ooooo.       
# 888ooooo888  d88' `88b  888   888' `88b      
# 888     888  888ooo888  888   888   888      
# 888     888  888    .o  888   888   888      
#o888o   o888o `Y8bod8P' o888o  888bod8P'      
#                               888            
#                              o888o              

# │    ╔════════════════════
function manual_header () {

  local level0="${C_LEVEL_0}${SYMB_VER_BAR}${SYMB_TAB}"
  local header="${COLOR_INFO}${SYMB_MANUAL_HEADER}"
  
  echo -e "${level0}${header}"

} 

# │    ║
function manual_prefix () {

  local message="$1"

  local level0="${C_LEVEL_0}${SYMB_VER_BAR}${SYMB_TAB}"
  local prefix="${COLOR_INFO}${SYMB_MANUAL_PREFIX}${SYMB_TAB}"
  
  echo -e "${level0}${prefix}${message}"

} 

# │    ╚════════════════════
function manual_bottom () {

  local level0="${C_LEVEL_0}${SYMB_VER_BAR}${SYMB_TAB}"
  local botom="${COLOR_INFO}${SYMB_MANUAL_BOTTOM}"
  
  echo -e "${level0}${botom}"

} 


