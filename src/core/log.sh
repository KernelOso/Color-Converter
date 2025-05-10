#!/usr/bin/env bash

function show_banner () {

  local sizeX=0
  local sizeY=0
  local image=(

  )

  source "${SCRIPT_DIR}/resources/image.sh"

  local ascii_art=""

  local value_sup_R=""
  local value_sup_G=""
  local value_sup_B=""

  local value_inf_R=""
  local value_inf_G=""
  local value_inf_B=""

  local sup_pixel_can_show=false
  local inf_pixel_can_show=false

  # Y bucle :
  local y_index_sup=0
  local y_index_inf=0

  local min_index_value_sup_pixel=0
  local max_index_value_sup_pixel=0

  local min_index_value_inf_pixel=0
  local max_index_value_inf_pixel=0

  local index_inf=0
  local index_sup=0

  for ((y = 0; y < sizeY; y += 2)); do

    # save index Y ( superior and inferior pixels)
    y_index_sup=$y
    y_index_inf=$((y_index_sup + 1))

    # get the minimal X index for each row
    # superior
    index_sup=$(( 0 + ( sizeX * y_index_sup ) * 3 ))

    # inferior
    index_inf=$(( 0 + ( sizeX * y_index_inf ) * 3))

    for ((x=1; x<=sizeX; x++)); do

      # reset values

        value_sup_R=""
        value_sup_G=""
        value_sup_B=""

        value_inf_R=""
        value_inf_G=""
        value_inf_B=""

        sup_pixel_can_show=false
        inf_pixel_can_show=false

      # --- superior pixel ---

      # save superior pixel values
      value_sup_R=${image[index_sup]}
      ((index_sup++))
      value_sup_G=${image[index_sup]}
      ((index_sup++))
      value_sup_B=${image[index_sup]}
      ((index_sup++))
      

      # --- inferior pixel ---

      # save inferior pixel values
      value_inf_R=${image[index_inf]}
      ((index_inf++))
      value_inf_G=${image[index_inf]}
      ((index_inf++))
      value_inf_B=${image[index_inf]}
      ((index_inf++))

      # --- transparent system ---

      # verify superior pixel
      if [[ -n "$value_sup_R" && -n "$value_sup_G" && -n "$value_sup_B" ]]; then
        if [[ "$value_sup_R" == "3" && "$value_sup_G" == "3" && "$value_sup_B" == "3" ]]; 
        then
          sup_pixel_can_show=false
        else
          sup_pixel_can_show=true
        fi
      fi

      # verify inferior pixel
      if [[ -n "$value_inf_R" && -n "$value_inf_G" && -n "$value_inf_B" ]]; then
        if [[ "$value_inf_R" == "3" && "$value_inf_G" == "3" && "$value_inf_B" == "3" ]]; 
        then
          inf_pixel_can_show=false
        else
          inf_pixel_can_show=true
        fi
      fi

      # create output

      #when both pixels can show
      if [[ "$sup_pixel_can_show" == "true" && "$inf_pixel_can_show" == "true" ]]; 
      then
        # show both thing

        # background
        ascii_art="${ascii_art}\e[48;2;${value_inf_R};${value_inf_G};${value_inf_B}m"

        # pixel
        ascii_art="${ascii_art}\e[38;2;${value_sup_R};${value_sup_G};${value_sup_B}m▀\e[0m"
      fi

      # when sup pixel can show but inferior don't
      if [[ "$sup_pixel_can_show" == "true" && "$inf_pixel_can_show" == "false" ]]; 
      then
        # show only the sup character
        ascii_art="${ascii_art}\e[38;2;${value_sup_R};${value_sup_G};${value_sup_B}m▀\e[0m"
      fi

      # when inf pixel can show but superior don't
      if [[ "$inf_pixel_can_show" == "true" && "$sup_pixel_can_show" == "false" ]]; 
      then
        # show only the inf character
        ascii_art="${ascii_art}\e[38;2;${value_inf_R};${value_inf_G};${value_inf_B}m▄\e[0m"
      fi

      #when both are transparent
      if [[ "$inf_pixel_can_show" == "false" && "$sup_pixel_can_show" == "false" ]]; 
      then
        # show a blank space
        ascii_art="${ascii_art} \e[0m"
      fi

    done

    # add line jump
    ascii_art="${ascii_art}\n"
  done

  #remove last line jump
  ascii_art="${ascii_art%??}"

  echo -e "$ascii_art"
  #echo  "$ascii_art"
}

function show_banner_legacy () {

  local sizeX=0
  local sizeY=0
  local image=(

  )

  source "${SCRIPT_DIR}/resources/image.sh"

  local index=0
  local ascii_art=""

  local value_R=""
  local value_G=""
  local value_B=""

  for ((y=1; y<=sizeY; y++)); do
    for ((x=1; x<=sizeX; x++)); do
      value_R=${image[index]}
      ((index++))
      value_G=${image[index]}
      ((index++))
      value_B=${image[index]}
      ((index++))

      ascii_art="${ascii_art}\e[48;2;${value_R};${value_G};${value_B}m"

      ascii_art="${ascii_art}  \e[0m"
    done
    ascii_art="${ascii_art}\n"
  done

  #remove last line jump
  ascii_art="${ascii_art%??}"

  echo -e "$ascii_art"
  #echo  "$ascii_art"
}

function log_welcome ( ) {
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


