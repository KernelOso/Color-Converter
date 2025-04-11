#! /bin/bash
# A not soo basic color-scheme reader – Bash script.
#
# Copyright (C) 2025 - github.com/KernelOso
#
# This project is licensed under the GNU General Public License v3.0.
# See the LICENSE file for details.

#                           ___ ___ _______ _______ ___ _______ _______  ___     _______ _______                          
#  ______ ______ ______    |   Y   |   _   |   _   |   |   _   |   _   \|   |   |   _   |   _   |    ______ ______ ______ 
# |______|______|______|   |.  |   |.  1   |.  l   |.  |.  1   |.  1   /|.  |   |.  1___|   1___|   |______|______|______|
#                          |.  |   |.  _   |.  _   |.  |.  _   |.  _   \|.  |___|.  __)_|____   |                         
#                          |:  1   |:  |   |:  |   |:  |:  |   |:  1    |:  1   |:  1   |:  1   |                         
#                           \:.. ./|::.|:. |::.|:. |::.|::.|:. |::.. .  |::.. . |::.. . |::.. . |                         
#                            `---' `--- ---`--- ---`---`--- ---`-------'`-------`-------`-------'                         

# params
F_param_was_used=false
T_param_was_used=false
B_param_was_used=false

param_with_args_was_used=false
arg_position=-1
type_of_param=""

file_arg=""


file_type_detected=false
file_type=""
are_missing_values=false

#caracteres de escape :
bRED="\033[0;31m"
bGREEN="\033[0;32m"
bYELLOW="\033[0;33m"
bBLUE="\033[0;34m"
bMAGN="\033[0;35m"
bCYAN="\033[0;36m"
bWHITE="\033[0;37m"
Reset="\033[0m"

#triggers :
trigg_preserv_name=false
trigg_kitty=false

#colors :
background=""
foreground=""
cursor=""foreground
b_black=""
b_red=""
b_green=""
b_yellow=""
b_blue=""
b_magenta=""
b_cyan=""
b_white=""
l_black=""
l_red=""
l_green=""
l_yellow=""
l_blue=""
l_magenta=""
l_cyan=""
l_white=""

# caracteres ascii : 
#─ 
#│ 
#┌  type_of_param
#┐  
#└  
#┘  
#├ 
#┤ 
#┬ 
#┴ 
#┼ 

#                           _______ _______ _______ _______ _______     _______ _______ ______   _______ _______                          
#  ______ ______ ______    |   _   |   _   |   _   |   _   |   _   \   |   _   |   _   |   _  \ |   _   |   _   |    ______ ______ ______ 
# |______|______|______|   |.  1___|.  l   |.  l   |.  |   |.  l   /   |.  1___|.  |   |.  |   \|.  1___|   1___|   |______|______|______|
#                          |.  __)_|.  _   |.  _   |.  |   |.  _   1   |.  |___|.  |   |.  |    |.  __)_|____   |                         
#                          |:  1   |:  |   |:  |   |:  1   |:  |   |   |:  1   |:  1   |:  1    |:  1   |:  1   |                         
#                          |::.. . |::.|:. |::.|:. |::.. . |::.|:. |   |::.. . |::.. . |::.. . /|::.. . |::.. . |                         
#                          `-------`--- ---`--- ---`-------`--- ---'   `-------`-------`------' `-------`-------'                         
                                                                                                                                         
# 0 : no errors
# 1 : missing dependency
# 2 : more than 1 param
# 3 : missing arg

#                          _______ ___ ___ ______  _______ ___ _______ ______  _______                          
#                         |   _   |   Y   |   _  \|       |   |   _   |   _  \|   _   |    
# ______ ______ ______    |.  1___|.  |   |.  |   |.|   | |.  |.  |   |.  |   |   1___|    ______ ______ ______
#|______|______|______|   |.  __) |.  |   |.  |   `-|.  |-|.  |.  |   |.  |   |____   |   |______|______|______|                      
#                         |:  |   |:  1   |:  |   | |:  | |:  |:  1   |:  |   |:  1   |                         
#                         |::.|   |::.. . |::.|   | |::.| |::.|::.. . |::.|   |::.. . |                         
#                         `---'   `-------`--- ---' `---' `---`-------`--- ---`-------'                                                                                                                                  

function exit_Code () {
  echo -e "$bWHITE└── ¤ Exiting whit code :  $1 $Reset"
  exit $1

  #TODO : messages for each type of error...
}

function verify_Dependencies () {

  # Dependency : yq
  if ! command -v yq &> /dev/null; then
    echo -e "$bWHITE│   $bYELLOW└──$bRED ¤ Error : Missing Depdencencie : $bCYAN yq $Reset"
    exit_Code 1
  fi 

}


#______                             
#| ___ \                            
#| |_/ /_ _ _ __ __ _ _ __ ___  ___ 
#|  __/ _` | '__/ _` | '_ ` _ \/ __|
#| | | (_| | | | (_| | | | | | \__ \
#\_|  \__,_|_|  \__,_|_| |_| |_|___/
function verify_Params () {
  params_used=0
  index=0

  for arg in "$@"; do

    ((index++))

    case "$arg" in 
      FILE)
        type_of_param="FILE"

        param_with_args_was_used=true

        ((params_used++))

        F_param_was_used=true

        arg_position=$index
        ((arg_position++))
        ;;
      THIS)
        type_of_param="THIS"

        ((params_used++))

        T_param_was_used=true
        ;;
      BADDIES)
        type_of_param="BADDIES"

        param_with_args_was_used=true

        ((params_used++))

        B_param_was_used=true
        
        arg_position=$index
        ((arg_position++))
        ;;
    esac

  done 

  # prevent double param
  if [[ "$params_used" > 1 ]]; then
    echo -e "$bWHITE│   $bYELLOW└──$bRED ¤ Error : More than one MAIN Param.$Reset"
    exit_Code 2
  fi

  # save args
  if [[ "$param_with_args_was_used" == true ]]; then
    # save arg
    file_arg="${!arg_position}"
  fi

  # verify missing args
  if [[ "$param_with_args_was_used" == true && "$file_arg" == "" ]]; then
    echo -e "$bWHITE│   $bYELLOW└──$bRED ¤ Error : Missing Arguments \`$type_of_param <file>\` $Reset"
    exit_Code 3
  fi


  # triggers 
}



# _____                                     
#/  ___|                                    
#\ `--.  ___ __ _ _ __  _ __   ___ _ __ ___ 
# `--. \/ __/ _` | '_ \| '_ \ / _ \ '__/ __|
#/\__/ / (_| (_| | | | | | | |  __/ |  \__ \
#\____/ \___\__,_|_| |_|_| |_|\___|_|  |___/

function verify_If_File_Exist () {

  echo -e "$bWHITE│   $bYELLOW│   $bBLUE├── $bMAGN¤ Verifying if file exist... $Reset"

  if [ -f "$1" ]; then
      echo -e "$bWHITE│   $bYELLOW│   $bBLUE│   $bMAGN└── $bGREEN¤ File :$bWHITE $1 $bGREEN: Exist! $Reset"
  else
      echo -e "$bWHITE│   $bYELLOW│   $bBLUE│   $bMAGN└── $bRED¤ ERROR... file :$bWHITE $1 $bRED: doesn't Exist! $Reset"
      echo -e "$bWHITE│   $bYELLOW│   $bBLUE└────────  $Reset"
      echo -e "$bWHITE│   $bYELLOW└──────────────  $Reset"
      exit_Code 7
  fi

}

function OsoB16_Scanner () {

  echo -e "$bWHITE│   $bYELLOW│   $bBLUE├── $bCYAN¤ Executing Oso's Base16 scanner... $Reset"

  if grep -qE 'background:' "$1" &&
   grep -qE 'foreground:' "$1" &&
   grep -qE 'cursor:' "$1" &&
   grep -qE 'b_black:' "$1" &&
   grep -qE 'b_red:' "$1" &&
   grep -qE 'b_green:' "$1" &&
   grep -qE 'b_yellow:' "$1" &&
   grep -qE 'b_blue:' "$1" &&
   grep -qE 'b_magenta:' "$1" &&
   grep -qE 'b_cyan:' "$1" &&
   grep -qE 'b_white:' "$1" &&
   grep -qE 'l_black:' "$1" &&
   grep -qE 'l_red:' "$1" &&
   grep -qE 'l_green:' "$1" &&
   grep -qE 'l_yellow:' "$1" &&
   grep -qE 'l_blue:' "$1" &&
   grep -qE 'l_magenta:' "$1" &&
   grep -qE 'l_cyan:' "$1" &&
   grep -qE 'l_white:' "$1"
  then

    echo -e "$bWHITE│   $bYELLOW│   $bBLUE│   $bCYAN└──$bGREEN ¤ Oso's Base16 format detected! $Reset"

    file_type_detected=true
    file_type="OsoB16"

  fi

}

function XResources_Scanner () {

  echo -e "$bWHITE│   $bYELLOW│   $bBLUE├── $bCYAN¤ Executing XResources scanner... $Reset"

  if grep -q "^! special" "$1" &&
    grep -q "^\*\.foreground:" "$1" &&
    grep -q "^\*\.background:" "$1" &&
    grep -q "^\*\.cursorColor:" "$1" &&
  
    grep -q "^! black" "$1" &&
    grep -q "^\*\.color0:" "$1" &&
    grep -q "^\*\.color8:" "$1" &&
  
    grep -q "^! red" "$1" &&
    grep -q "^\*\.color1:" "$1" &&
    grep -q "^\*\.color9:" "$1" &&
  
    grep -q "^! green" "$1" &&
    grep -q "^\*\.color2:" "$1" &&
    grep -q "^\*\.color10:" "$1" &&
  
    grep -q "^! yellow" "$1" &&
    grep -q "^\*\.color3:" "$1" &&
    grep -q "^\*\.color11:" "$1" &&
  
    grep -q "^! blue" "$1" &&
    grep -q "^\*\.color4:" "$1" &&
    grep -q "^\*\.color12:" "$1" &&

    grep -q "^! magenta" "$1" &&
    grep -q "^\*\.color5:" "$1" &&
    grep -q "^\*\.color13:" "$1" &&

    grep -q "^! cyan" "$1" &&
    grep -q "^\*\.color6:" "$1" &&
    grep -q "^\*\.color14:" "$1" &&

    grep -q "^! white" "$1" &&
    grep -q "^\*\.color7:" "$1" &&
    grep -q "^\*\.color15:" "$1"
  then

    echo -e "$bWHITE│   $bYELLOW│   $bBLUE│   $bCYAN└──$bGREEN ¤ XResources format detected! $Reset"

    file_type_detected=true
    file_type="XResources"

  fi

}

function exec_Scanners () {

  echo -e "$bWHITE│   $bYELLOW├── $bBLUE¤ Scanning file :$bWHITE $1 $bBLUE: ...$Reset"

  file_type_detected=false

  verify_If_File_Exist $1

  # Verify if the file isn't empty
  if [[ ! -s "$1" ]]; then
    echo -e "$bWHITE│   $bYELLOW│   $bBLUE│$Reset"
    echo -e "$bWHITE│   $bYELLOW│   $bBLUE└── $bRED¤ ERROR... file :$bWHITE $1 $bRED: is empty! $Reset"
    echo -e "$bWHITE│   $bYELLOW└──────── $Reset"
    exit_Code 5
  fi


  # scanners...Background

  #XResources scanner
  if [[ "$file_type_detected" == false ]]; then
    XResources_Scanner $1
  fi

  if [[ "$file_type_detected" == false ]]; then
    OsoB16_Scanner $1
  fi

  #format message
  if [[ "$file_type_detected" == true ]]; then

    echo -e "$bWHITE│   $bYELLOW│   $bBLUE│$Reset"
    echo -e "$bWHITE│   $bYELLOW│   $bBLUE└── $bGREEN¤ :$bWHITE $file_type $bGREEN: Format detected!  $Reset"

  else
    echo -e "$bWHITE│   $bYELLOW│   $bBLUE│$Reset"
    echo -e "$bWHITE│   $bYELLOW│   $bBLUE└── $bRED¤ Can't identify format in file :$bWHITE $1 $bRED...   $Reset"
    echo -e "$bWHITE│   $bYELLOW└──────── $Reset"
    exit_Code 6

  fi

}


#______     _       _            
#| ___ \   (_)     | |           
#| |_/ / __ _ _ __ | |_ ___ _ __ 
#|  __/ '__| | '_ \| __/ _ \ '__|
#| |  | |  | | | | | ||  __/ |   
#\_|  |_|  |_|_| |_|\__\___|_|   

function print_Colors () {

  echo -e "$bWHITE│   $bYELLOW├── $bBLUE¤ Colors : $Reset"

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



  cat <<EOF
$(printf "$bWHITE│   $bYELLOW│   $bBLUE│ $bRED                                    
$bWHITE│   $bYELLOW│   $bBLUE│
$bWHITE│   $bYELLOW│   $bBLUE│   $Reset BackGround : \e[48;2;${rBackground};${gBackground};${bBackground}m    $Reset  | ForeGround : \e[48;2;${rForeground};${gForeground};${bForeground}m    $Reset 
$bWHITE│   $bYELLOW│   $bBLUE│
$bWHITE│   $bYELLOW│   $bBLUE│   $Reset bBlack     : \e[48;2;${rBBlack};${gBBlack};${bBBlack}m    $Reset  | lBlack     : \e[48;2;${rLBlack};${gLBlack};${bLBlack}m    $Reset
$bWHITE│   $bYELLOW│   $bBLUE│   $Reset bRed       : \e[48;2;${rBRed};${gBRed};${bBRed}m    $Reset  | lRed       : \e[48;2;${rLRed};${gLRed};${bLRed}m    $Reset
$bWHITE│   $bYELLOW│   $bBLUE│   $Reset bGreen     : \e[48;2;${rBGreen};${gBGreen};${bBGreen}m    $Reset  | lGreen     : \e[48;2;${rLGreen};${gLGreen};${bLGreen}m    $Reset
$bWHITE│   $bYELLOW│   $bBLUE│   $Reset bYellow    : \e[48;2;${rBYellow};${gBYellow};${bBYellow}m    $Reset  | lYellow    : \e[48;2;${rLYellow};${gLYellow};${bLYellow}m    $Reset
$bWHITE│   $bYELLOW│   $bBLUE│   $Reset bBlue      : \e[48;2;${rBBlue};${gBBlue};${bBBlue}m    $Reset  | lBlue      : \e[48;2;${rLBlue};${gLBlue};${bLBlue}m    $Reset
$bWHITE│   $bYELLOW│   $bBLUE│   $Reset bMagenta   : \e[48;2;${rBMagenta};${gBMagenta};${bBMagenta}m    $Reset  | lMagenta   : \e[48;2;${rLMagenta};${gLMagenta};${bLMagenta}m    $Reset
$bWHITE│   $bYELLOW│   $bBLUE│   $Reset bCyan      : \e[48;2;${rBCyan};${gBCyan};${bBCyan}m    $Reset  | lCyan      : \e[48;2;${rLCyan};${gLCyan};${bLCyan}m    $Reset
$bWHITE│   $bYELLOW│   $bBLUE│   $Reset bWhite     : \e[48;2;${rBWhite};${gBWhite};${bBWhite}m    $Reset  | lWhite     : \e[48;2;${rLWhite};${gLWhite};${bLWhite}m    $Reset
$bWHITE│   $bYELLOW│   $bBLUE│
$bWHITE│   $bYELLOW│   $bBLUE│
$bWHITE│   $bYELLOW│   $bBLUE└────────────────────────────────────────────
")
EOF

}



#______               _               
#| ___ \             | |              
#| |_/ /___  __ _  __| | ___ _ __ ___ 
#|    // _ \/ _` |/ _` |/ _ \ '__/ __|
#| |\ \  __/ (_| | (_| |  __/ |  \__ \
#\_| \_\___|\__,_|\__,_|\___|_|  |___/

function OsoB16_Reader() {

  # guardar los valores en variables

  if grep -qE '^background: *($|""$)' "$1" ||
   grep -qE '^foreground: *($|""$)' "$1" ||
   grep -qE '^cursor: *($|""$)' "$1" ||
   grep -qE '^b_black: *($|""$)' "$1" ||
   grep -qE '^b_red: *($|""$)' "$1" ||
   grep -qE '^b_green: *($|""$)' "$1" ||
   grep -qE '^b_yellow: *($|""$)' "$1" ||
   grep -qE '^b_blue: *($|""$)' "$1" ||
   grep -qE '^b_magenta: *($|""$)' "$1" ||
   grep -qE '^b_cyan: *($|""$)' "$1" ||
   grep -qE '^b_white: *($|""$)' "$1" ||
   grep -qE '^l_black: *($|""$)' "$1" ||
   grep -qE '^l_red: *($|""$)' "$1" ||
   grep -qE '^l_green: *($|""$)' "$1" ||
   grep -qE '^l_yellow: *($|""$)' "$1" ||
   grep -qE '^l_blue: *($|""$)' "$1" ||
   grep -qE '^l_magenta: *($|""$)' "$1" ||
   grep -qE '^l_cyan: *($|""$)' "$1" ||
   grep -qE '^l_white: *($|""$)' "$1"
  then
    echo -e "$bWHITE│   $bYELLOW│   $bBLUE│$Reset"
    echo -e "$bWHITE│   $bYELLOW│   $bBLUE└── $bRED¤ ERROR : Missing values...$Reset"
    echo -e "$bWHITE│   $bYELLOW└────────$Reset"
    exit_Code 4
  fi

  background=$(yq -r '.background' "$1" )
  foreground=$(yq -r '.foreground' "$1" )
  cursor=$(yq -r '.cursor' "$1" )

  b_black=$(yq -r '.b_black' "$1" )
  b_red=$(yq -r '.b_red' "$1" )
  b_green=$(yq -r '.b_green' "$1" )
  b_yellow=$(yq -r '.b_yellow' "$1" )
  b_blue=$(yq -r '.b_blue' "$1" )
  b_magenta=$(yq -r '.b_magenta' "$1" )
  b_cyan=$(yq -r '.b_cyan' "$1" )
  b_white=$(yq -r '.b_white' "$1" )

  l_black=$(yq -r '.l_black' "$1" )
  l_red=$(yq -r '.l_red' "$1" )
  l_green=$(yq -r '.l_green' "$1" )
  l_yellow=$(yq -r '.l_yellow' "$1" )
  l_blue=$(yq -r '.l_blue' "$1" )
  l_magenta=$(yq -r '.l_magenta' "$1" )
  l_cyan=$(yq -r '.l_cyan' "$1" )
  l_white=$(yq -r '.l_white' "$1" )

}

function XResources_Reader () {



  # guardar los valores en variables
  background=$(grep '\*.background:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  foreground=$(grep '\*.foreground:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  cursor=$(grep '\*.cursorColor:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_black=$(grep '\*.color0:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_black=$(grep '\*.color8:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_red=$(grep '\*.color1:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_red=$(grep '\*.color9:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_green=$(grep '\*.color2:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_green=$(grep '\*.color10:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_yellow=$(grep '\*.color3:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_yellow=$(grep '\*.color11:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_blue=$(grep '\*.color4:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_blue=$(grep '\*.color12:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_magenta=$(grep '\*.color5:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_magenta=$(grep '\*.color13:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_cyan=$(grep '\*.color6:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_cyan=$(grep '\*.color14:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_white=$(grep '\*.color7:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_white=$(grep '\*.color15:' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  if [ -z "$background" ] || [ -z "$foreground" ] || [ -z "$cursor" ] || \
   [ -z "$b_black" ] || [ -z "$l_black" ] || \
   [ -z "$b_red" ] || [ -z "$l_red" ] || \
   [ -z "$b_green" ] || [ -z "$l_green" ] || \
   [ -z "$b_yellow" ] || [ -z "$l_yellow" ] || \
   [ -z "$b_blue" ] || [ -z "$l_blue" ] || \
   [ -z "$b_magenta" ] || [ -z "$l_magenta" ] || \
   [ -z "$b_cyan" ] || [ -z "$l_cyan" ] || \
   [ -z "$b_white" ] || [ -z "$l_white" ]; then
    
    echo -e "$bWHITE│   $bYELLOW│   $bBLUE│$Reset"
    echo -e "$bWHITE│   $bYELLOW│   $bBLUE└── $bRED¤ ERROR : Missing values...$Reset"
    echo -e "$bWHITE│   $bYELLOW└────────$Reset"
    exit_Code 4

  fi

}



function exec_Reader () {

  echo -e "$bWHITE│   $bYELLOW├── $bBLUE¤ Reading file :$bWHITE $1 $bBLUE: ...$Reset"

  # Reste variables :

  background=""
  foreground=""
  cursor=""
  b_black=""
  b_red=""
  b_green=""
  b_yellow=""
  b_blue=""
  b_magenta=""
  b_cyan=""
  b_white=""
  l_black=""
  l_red=""
  l_green=""
  l_yellow=""
  l_blue=""
  l_magenta=""
  l_cyan=""
  l_white=""


  # Read file
  case "$2" in 

    "XResources")
      # XResources Reader
      XResources_Reader $1
      ;;

    "OsoB16")
      # Oso's Base16 Reader
      OsoB16_Reader $1 
      ;;
      


  esac
}


# _____                    _                 
#|  ___|                  | |                
#| |____  _____  ___ _   _| |_ ___  _ __ ___ 
#|  __\ \/ / _ \/ __| | | | __/ _ \| '__/ __|
#| |___>  <  __/ (__| |_| | || (_) | |  \__ \
#\____/_/\_\___|\___|\__,_|\__\___/|_|  |___/
function exec_FILE () {

  echo -e "$bWHITE├── $bYELLOW¤ Executing \"FILE\" process...$Reset"

  # Scannn the file
  exec_Scanners $file_arg

  # Read the file
  if [[ "$file_type_detected" == true ]]; then
    exec_Reader $file_arg $file_type
  fi

  # Show colors
  print_Colors

  # Exec triggers...

  

}

function exec_THIS () {

  echo -e "$bWHITE├── $bYELLOW¤ Executing \"THIS\" process...$Reset"

}

function exec_BADDIES () {

  echo -e "$bWHITE├── $bYELLOW¤ Executing \"BADDIES\" process...$Reset"

}

function exec_Engine () {

  #1. case to exec each function

  case "$type_of_param" in 

    "FILE")
      exec_FILE
      ;;

    "THIS")
      exec_THIS
      ;;

    "BADDIES")
      exec_BADDIES
      ;;

  esac

}


#                           ___ ___ _______ ___ ______                           
#  ______ ______ ______    |   Y   |   _   |   |   _  \     ______ ______ ______ 
# |______|______|______|   |.      |.  1   |.  |.  |   |   |______|______|______|
#                          |. \_/  |.  _   |.  |.  |   |                         
#                          |:  |   |:  |   |:  |:  |   |                         
#                          |::.|:. |::.|:. |::.|::.|   |                         
#                          `--- ---`--- ---`---`--- ---'                         



clear
cat <<EOF
$(printf "
$bRED _______       __                   _______                                        
|   _   .-----|  .-----.----.______|   _   .----.-----.----.-----.-----.-----.----.
|.  1___|  _  |  |  _  |   _|______|.  1   |   _|  _  |  __|  -__|__ --|  _  |   _|
|.  |___|_____|__|_____|__|        |.  ____|__| |_____|____|_____|_____|_____|__|  
|:  1   |                          |:  |                                           
|::.. . |                          |::.|                                           
\`-------'                          \`---'  $Reset 
") 
EOF
echo -e "$bWHITE¤ Wellcome!$Reset"



# 3. verify params
echo -e "$bWHITE├── $bYELLOW¤ Verifiying params...$Reset"
verify_Params $@ 

  

# 4. verify dependencies
echo -e "$bWHITE├── $bYELLOW¤ Verifiying dependencies...$Reset"
#verifying functions...
verify_Dependencies



# 4. Exec logic / # 5. exec escanners
exec_Engine


exit_Code 0