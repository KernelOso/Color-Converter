#! /bin/bash
# A not soo basic color-scheme reader – Bash script.
#
# Copyright (C) 2025 - github.com/KernelOso
#
# This project is licensed under the GNU General Public License v3.0.
# See the LICENSE file for details.


                                                                                                        
#       8b           d8                        88              88           88                                   
#       `8b         d8'                        ""              88           88                                   
#        `8b       d8'                                         88           88                                   
#         `8b     d8'  ,adPPYYba,  8b,dPPYba,  88  ,adPPYYba,  88,dPPYba,   88   ,adPPYba,  ,adPPYba,            
#aaaaaaaa  `8b   d8'   ""     `Y8  88P'   "Y8  88  ""     `Y8  88P'    "8a  88  a8P_____88  I8[    ""  aaaaaaaa  
#""""""""   `8b d8'    ,adPPPPP88  88          88  ,adPPPPP88  88       d8  88  8PP"""""""   `"Y8ba,   """"""""  
#            `888'     88,    ,88  88          88  88,    ,88  88b,   ,a8"  88  "8b,   ,aa  aa    ]8I            
#             `8'      `"8bbdP"Y8  88          88  `"8bbdP"Y8  8Y"Ybbd8"'   88   `"Ybbd8"'  `"YbbdP"'            
# Param verify
param_with_args_was_used=false
arg_position=-1
type_of_param=""

# arg verify
file_arg=""
bsname=""

# esc characters
cR="\033[0;31m"
cG="\033[0;32m"
cY="\033[0;33m"
cB="\033[0;34m"
cM="\033[0;35m"
cC="\033[0;36m"
cW="\033[0;37m"
Rs="\033[0m"

#triggers :
triggers_used=false

  #Helpers
  trigg_debug=false
  trigg_help=false

  #Actions
  trigg_get=false
  trigg_rm=false
  trigg_install=false
  trigg_convert=false

#formats
output_file=""

formats_used=false

trigg_all=false
format_kitty=false
format_xresources=false
format_alacritty=false
format_osoB16=false
format_Termite=false
format_Termux=false
format_LinuxTTY=false

# triggers values : 

  # trigg preserv name : 
  original_name=""

#Files verification
file_type=""
file_type_detected=false
are_missing_values=false

fileExist=false
fileEmpty=false
fileAccess=false
dataVerified=false
canDownload=false

#Baddies 
actual_Dir=""

#colors :
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

# caracteres ascii : 
#─ 
#│ 
#┌  
#┐  
#└  
#┘  
#├ 
#┤ 
#┬ 
#┴ 
#┼ 


                                                                                                                    
#          88888888888               88                ,ad8888ba,                         88                                   
#          88                        ""    ,d         d8"'    `"8b                        88                                   
#          88                              88        d8'                                  88                                   
#          88aaaaa      8b,     ,d8  88  MM88MMM     88              ,adPPYba,    ,adPPYb,88   ,adPPYba,  ,adPPYba,            
#aaaaaaaa  88"""""       `Y8, ,8P'   88    88        88             a8"     "8a  a8"    `Y88  a8P_____88  I8[    ""  aaaaaaaa  
#""""""""  88              )888(     88    88        Y8,            8b       d8  8b       88  8PP"""""""   `"Y8ba,   """"""""  
#          88            ,d8" "8b,   88    88,        Y8a.    .a8P  "8a,   ,a8"  "8a,   ,d88  "8b,   ,aa  aa    ]8I            
#          88888888888  8P'     `Y8  88    "Y888       `"Y8888Y"'    `"YbbdP"'    `"8bbdP"Y8   `"Ybbd8"'  `"YbbdP"'                     
function exit_Code () {
  echo -e "$cW└── ¤ Exiting whit code :  $1 $Rs"

  case "$1" in

    # 0 : no errors
    "0")
      echo -e "    $cW└── $cG¤ No Errors! $Rs"
    ;;

    # 1 : missing dependency
    "1")
      echo -e "    $cW└── $cR¤ ERROR : Missing dependencies $Rs"
    ;;

    # 2 : more than 1 param
    "2")
      echo -e "    $cW└── $cR¤ ERROR : More than 1 param $Rs"
    ;;

    # 3 : missing arg
    "3")
      echo -e "    $cW└── $cR¤ ERROR : Missing arguments $Rs"
    ;;

    # 4 : missing values
    "4")
      echo -e "    $cW└── $cR¤ ERROR : Missing data values $Rs"
    ;;

    # 5 : empty file
    "5")
      echo -e "    $cW└── $cR¤ ERROR : Empty file $Rs"
    ;;

    # 6 : color-scheme format undetected
    "6")
      echo -e "    $cW└── $cR¤ ERROR : color-scheme format undetected $Rs"
    ;;

    # 7 : file doesn't exist
    "7")
      echo -e "    $cW└── $cR¤ ERROR : File doesn't exits $Rs"
    ;;

    # 8 : unaccsesbile file
    "8")
      echo -e "    $cW└── $cR¤ ERROR : Unaccsesible file $Rs"
    ;;

    # 9 : ussing a trigger like an arg
    "9")
      echo -e "    $cW└── $cR¤ ERROR : Using a trigger like an argument $Rs"
    ;;

    "10")
      echo -e "    $cW└─ $cR¤ ERROR : can't access to the file...$Rs"
    ;;

    

  esac

  exit $1
}



#          88        88  88888888888  88           88888888ba      88b           d88                                                    88            
#          88        88  88           88           88      "8b     888b         d888                                                    88            
#          88        88  88           88           88      ,8P     88`8b       d8'88                                                    88            
#          88aaaaaaaa88  88aaaaa      88           88aaaaaa8P'     88 `8b     d8' 88  ,adPPYYba,  8b,dPPYba,   88       88  ,adPPYYba,  88            
#aaaaaaaa  88""""""""88  88"""""      88           88""""""'       88  `8b   d8'  88  ""     `Y8  88P'   `"8a  88       88  ""     `Y8  88  aaaaaaaa  
#""""""""  88        88  88           88           88              88   `8b d8'   88  ,adPPPPP88  88       88  88       88  ,adPPPPP88  88  """"""""  
#          88        88  88           88           88              88    `888'    88  88,    ,88  88       88  "8a,   ,a88  88,    ,88  88            
#          88        88  88888888888  88888888888  88              88     `8'     88  `"8bbdP"Y8  88       88   `"YbbdP'Y8  `"8bbdP"Y8  88            
function help_Message () {

  if [[ $trigg_help == true ]]; then
    echo -e "$cW├── $cC¤ Help Message : $Rs"
    cat <<EOF
$(printf "$cW│   $cC╔════════════════════$Rs  
$cW│   $cC║$Rs  Color-Procesor : A color-scheme converter tool!
$cW│   $cC║$Rs
$cW│   $cC║$Rs $cM #Dependencies :
$cW│   $cC║$Rs
$cW│   $cC║$Rs    ¤$cM Bash
$cW│   $cC║$Rs    ¤$cM yq
$cW│   $cC║$Rs    ¤$cM taplo
$cW│   $cC║$Rs
$cW│   $cC║$Rs $cB # Usage : 
$cW│   $cC║$Rs    
$cW│   $cC║$Rs   $cB Color-Converter.sh $cC[help(s)] $cR[process] $cW| $cR[process] $cC[help(s)] $Rs
$cW│   $cC║$Rs
$cW│   $cC║$Rs $cC ## Helps :
$cW│   $cC║$Rs    
$cW│   $cC║$Rs    ¤$cC [ -h | --help ]  $cW        :  $cC Show THIS manual.
$cW│   $cC║$Rs    ¤$cC [ -d | --debug ] $cW        :  $cC Show the extra debug messages.
$cW│   $cC║$Rs    
$cW│   $cC║$Rs $cR ## Processes :
$cW│   $cC║$Rs    
$cW│   $cC║$Rs    ¤$cR SHOW $cW<file> $cY[trigger(s)] $cW:$cR Only SHOW the information in one $cW<file>$cR.
$cW│   $cC║$Rs    ¤$cR FILE $cW<file> $cY[trigger(s)] $cW:$cR Process only one $cW<file>$cR.
$cW│   $cC║$Rs    
$cW│   $cC║$Rs $cY ###$cR 'FILE' process$cY triggers :
$cW│   $cC║$Rs  
$cW│   $cC║$Rs    ¤$cY --get $cW                   :$cY Indicate that the $cW<file>$cY arg is the URL of the file in raw/GET.
$cW│   $cC║$Rs    ¤$cY --rm  $cW                   :$cY Remove the $cW<file>$cY post process. 
$cW│   $cC║$Rs    ¤$cY --install [format(s)] $cW   :$cY Install the color-scheme into the [format(s)](Terminal(s))
$cW│   $cC║$Rs                                $cY selected.
$cW│   $cC║$Rs    ¤$cY --convert [format(s)] $cW   :$cY Install the color-scheme into the [format(s)](Terminal(s))
$cW│   $cC║$Rs                                $cY selected.
$cW│   $cC║$Rs
$cW│   $cC║$Rs $cY ###$cR 'SHOW' process$cY triggers :
$cW│   $cC║$Rs  
$cW│   $cC║$Rs    ¤$cY --get $cW                   :$cY Indicate that the $cW<file>$cY arg is the URL of the file in raw/GET.
$cW│   $cC║$Rs    ¤$cY --rm  $cW                   :$cY Remove the $cW<file>$cY post process. 
$cW│   $cC║$Rs
$cW│   $cC║$Rs $cM ## Formats :
$cW│   $cC║$Rs
$cW│   $cC║$Rs    ¤$cM --all $cW                   :$cY Use ALL the avalible formats
$cW│   $cC║$Rs
$cW│   $cC║$Rs    $cM╔════════════════╦════════════════╦════════════════╦════════════════╦════════════════╗
$cW│   $cC║$Rs    $cM║ Format Name    ║ Format param   ║ Input Supp?    ║ Install Supp?  ║ Convert Supp?  ║
$cW│   $cC║$Rs    $cM╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$cW│   $cC║$Rs    $cM║ Gogh           ║$cR NULL           $cM║$cG YES            $cM║$cR NO             $cM║$cR NO             $cM║
$cW│   $cC║$Rs    $cM╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$cW│   $cC║$Rs    $cM║ Oso's Base16   ║$cG --oso          $cM║$cG YES            $cM║$cR NO             $cM║$cG YES            $cM║
$cW│   $cC║$Rs    $cM╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$cW│   $cC║$Rs    $cM║ Base16         ║$cR NULL           $cM║$cG YES            $cM║$cR NO             $cM║$cR NO             $cM║
$cW│   $cC║$Rs    $cM╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$cW│   $cC║$Rs    $cM║ XResources     ║$cG --xresources   $cM║$cG YES            $cM║$cR NO             $cM║$cG YES            $cM║
$cW│   $cC║$Rs    $cM╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$cW│   $cC║$Rs    $cM║ Kitty .conf    ║$cG --kitty        $cM║$cG YES            $cM║$cG YES            $cM║$cG YES            $cM║
$cW│   $cC║$Rs    $cM╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$cW│   $cC║$Rs    $cM║ Alacritty.toml ║$cG --alacritty    $cM║$cG YES            $cM║$cR NO             $cM║$cG YES            $cM║
$cW│   $cC║$Rs    $cM╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$cW│   $cC║$Rs    $cM║ Termite        ║$cG --termite      $cM║$cR NO             $cM║$cR NO             $cM║$cG YES            $cM║
$cW│   $cC║$Rs    $cM╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$cW│   $cC║$Rs    $cM║ Termux         ║$cG --termux       $cM║$cR NO             $cM║$cR NO             $cM║$cG YES            $cM║
$cW│   $cC║$Rs    $cM╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$cW│   $cC║$Rs    $cM║ Linux TTY      ║$cG --linuxtty     $cM║$cR NO             $cM║$cR NO             $cM║$cG YES            $cM║
$cW│   $cC║$Rs    $cM╚════════════════╩════════════════╩════════════════╩════════════════╩════════════════╝
$cW│   $cC║$Rs
$cW│   $cC╚════════════════════$Rs
")
EOF

#$cW│   $cC║$Rs    ╔════════════════╦════════════════╦════════════════╦════════════════╦════════════════╗
#$cW│   $cC║$Rs    ║ Format Name    ║ Format param   ║ Input Supp?    ║ Install Supp?  ║ Convert Supp?  ║
#$cW│   $cC║$Rs    ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
#$cW│   $cC║$Rs    ║ Gogh           ║ NULL           ║ YES            ║ NO             ║ NO             ║
#$cW│   $cC║$Rs    ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
#$cW│   $cC║$Rs    ║ Oso's Base16   ║ NULL           ║ YES            ║ NO             ║ NO             ║
#$cW│   $cC║$Rs    ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
#$cW│   $cC║$Rs    ║ XResources     ║ NULL           ║ YES            ║ NO             ║ NO             ║
#$cW│   $cC║$Rs    ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
#$cW│   $cC║$Rs    ║ Kitty .conf    ║ --kitty        ║ NO             ║ YES            ║ NO             ║
#$cW│   $cC║$Rs    ╚════════════════╩════════════════╩════════════════╩════════════════╩════════════════╝

  fi
}


                                                                                                                                                                                         
#          88888888888  88  88                 8b           d8                       88     ad88  88                                   88                                                 
#          88           ""  88                 `8b         d8'                       ""    d8"    ""                            ,d     ""                                                 
#          88               88                  `8b       d8'                              88                                   88                                                        
#          88aaaaa      88  88   ,adPPYba,       `8b     d8'  ,adPPYba,  8b,dPPYba,  88  MM88MMM  88   ,adPPYba,  ,adPPYYba,  MM88MMM  88   ,adPPYba,   8b,dPPYba,   ,adPPYba,            
#aaaaaaaa  88"""""      88  88  a8P_____88        `8b   d8'  a8P_____88  88P'   "Y8  88    88     88  a8"     ""  ""     `Y8    88     88  a8"     "8a  88P'   `"8a  I8[    ""  aaaaaaaa  
#""""""""  88           88  88  8PP"""""""         `8b d8'   8PP"""""""  88          88    88     88  8b          ,adPPPPP88    88     88  8b       d8  88       88   `"Y8ba,   """"""""  
#          88           88  88  "8b,   ,aa          `888'    "8b,   ,aa  88          88    88     88  "8a,   ,aa  88,    ,88    88,    88  "8a,   ,a8"  88       88  aa    ]8I            
#          88           88  88   `"Ybbd8"'           `8'      `"Ybbd8"'  88          88    88     88   `"Ybbd8"'  `"8bbdP"Y8    "Y888  88   `"YbbdP"'   88       88  `"YbbdP"'            
                                                                                                                                                                                         
                                                                                                                                                                                         
# _____                _        ___  
#|  ___|              | |      |__ \ 
#| |__ _ __ ___  _ __ | |_ _   _  ) |
#|  __| '_ ` _ \| '_ \| __| | | |/ / 
#| |__| | | | | | |_) | |_| |_| |_|  
#\____/_| |_| |_| .__/ \__|\__, (_)  
#               | |         __/ |    
#               |_|        |___/     
function verify_If_Empty () {

  debug_Message "$cW│   $cR│   $cC│   $cM├── $cB¤ Verifying if file is empty... $Rs"

  if [[ ! -s "$1" ]]; then

    
    debug_Message "$cW│   $cR│   $cC│   $cM│   $cB└── $cR¤ ERROR... file :$cW $1 $cR: is empty! $Rs" "$cW│   $cR│   $cC├── $cR¤ ERROR... file :$cW $1 $cR: is empty! $Rs"   
    
    fileEmpty=true

  else 

    debug_Message "$cW│   $cR│   $cC│   $cM│   $cB└── $cG¤ File :$cW $1 $cG: is not empty! $Rs"

    fileEmpty=false

  fi

}

#______ _ _        _____     _     _  ___  
#|  ___(_) |      |  ___|   (_)   | ||__ \ 
#| |_   _| | ___  | |____  ___ ___| |_  ) |
#|  _| | | |/ _ \ |  __\ \/ / / __| __|/ / 
#| |   | | |  __/ | |___>  <| \__ \ |_|_|  
#\_|   |_|_|\___| \____/_/\_\_|___/\__(_)                                       
function verify_If_File_Exist () {

  debug_Message "$cW│   $cR│   $cC│   $cM├── $cB¤ Verifying if file exist... $Rs"
  
  if [ -f "$1" ]; then

      debug_Message "$cW│   $cR│   $cC│   $cM│   $cB└── $cG¤ File :$cW $1 $cG: Exist! $Rs"

      fileExist=true

  else

      debug_Message "$cW│   $cR│   $cC│   $cM│   $cB└── $cR¤ ERROR... file :$cW $1 $cR: doesn't Exist! $Rs" "$cW│   $cR│   $cC├── $cR¤ ERROR... file :$cW $1 $cR: doesn't Exist! $Rs"   
      fileExist=false

  fi

}



#  ___                       ___  
# / _ \                     |__ \ 
#/ /_\ \ ___ ___ ___  ___ ___  ) |
#|  _  |/ __/ __/ _ \/ __/ __|/ / 
#| | | | (_| (_|  __/\__ \__ \_|  
#\_| |_/\___\___\___||___/___(_)  
function verify_If_Access () {


  debug_Message "$cW│   $cR│   $cC│   $cM├── $cB¤ Verifying if can access to file... $Rs"
  
  if [  -r "$1" ]; then

      debug_Message "$cW│   $cR│   $cC│   $cM│   $cB└── $cG¤ File :$cW $1 $cG: can be accessed! $Rs"

      fileAccess=true

  else

      debug_Message "$cW│   $cR│   $cC│   $cM│   $cB└── $cR¤ ERROR... can't access to file :$cW $1 $cR: ! $Rs" "$cW│   $cR│   $cC├── $cR¤ ERROR... can't access to file :$cW $1 $cR: ! $Rs"   

      fileAccess=false

  fi

}



# _   _           _  __         _____     _ _   
#| | | |         (_)/ _|       |  ___|   (_) |  
#| | | | ___ _ __ _| |_ _   _  | |____  ___| |_ 
#| | | |/ _ \ '__| |  _| | | | |  __\ \/ / | __|
#\ \_/ /  __/ |  | | | | |_| | | |___>  <| | |_ 
# \___/ \___|_|  |_|_|  \__, | \____/_/\_\_|\__|
#                        __/ |                  
#                       |___/                   
function verify_File_whit_Exit () {

  # mensaje debug de : verificando archivo

  debug_Message "$cW│   $cR│   $cC├── $cM¤ Verifying file... $Rs"

  # Rs Variables
  fileExist=false
  fileEmpty=false
  fileAccess=false

  #Exist?
  verify_If_File_Exist $1
  if [[ "$fileExist" == false ]]; then

    debug_Message "$cW│   $cR│   $cC│   $cM└────────"   "$cW│   $cR│   $cC└──── "
    debug_Message "$cW│   $cR│   $cC└─────────────"        "$cW│   $cR└─────────"
    debug_Message "$cW│   $cR└──────────────────" 

    exit_Code 7
  fi

  #Access?
  verify_If_Access $1
  if [[ "$fileAccess" == false ]]; then

    debug_Message "$cW│   $cR│   $cC│   $cM└────────"   "$cW│   $cR│   $cC└──── "
    debug_Message "$cW│   $cR│   $cC└─────────────"        "$cW│   $cR└─────────"
    debug_Message "$cW│   $cR└──────────────────" 

    exit_Code 5
  fi

  #Empty?
  verify_If_Empty $1
  if [[ "$fileEmpty" == true ]]; then

    debug_Message "$cW│   $cR│   $cC│   $cM└────────"   "$cW│   $cR│   $cC└──── "
    debug_Message "$cW│   $cR│   $cC└─────────────"        "$cW│   $cR└─────────"
    debug_Message "$cW│   $cR└──────────────────" 

    exit_Code 5
  fi

  debug_Message "$cW│   $cR│   $cC│   $cM└── $cG¤ File verified!" 

  


}
                                                                                                        
#          88888888888                                88                                                 
#          88                                  ,d     ""                                                 
#          88                                  88                                                        
#          88aaaaa  88       88  8b,dPPYba,  MM88MMM  88   ,adPPYba,   8b,dPPYba,   ,adPPYba,            
#aaaaaaaa  88"""""  88       88  88P'   `"8a   88     88  a8"     "8a  88P'   `"8a  I8[    ""  aaaaaaaa  
#""""""""  88       88       88  88       88   88     88  8b       d8  88       88   `"Y8ba,   """"""""  
#          88       "8a,   ,a88  88       88   88,    88  "8a,   ,a8"  88       88  aa    ]8I            
#          88        `"YbbdP'Y8  88       88   "Y888  88   `"YbbdP"'   88       88  `"YbbdP"'            

# _   _           _  __        ______      _        
#| | | |         (_)/ _|       |  _  \    | |       
#| | | | ___ _ __ _| |_ _   _  | | | |__ _| |_ __ _ 
#| | | |/ _ \ '__| |  _| | | | | | | / _` | __/ _` |
#\ \_/ /  __/ |  | | | | |_| | | |/ / (_| | || (_| |
# \___/ \___|_|  |_|_|  \__, | |___/ \__,_|\__\__,_|
#                        __/ |                      
#                       |___/                       
function verify_Data () {

  # Verify data
  if [ -z "$background" ] || [ "$background" = "null" ] || \
   [ -z "$foreground" ] || [ "$foreground" = "null" ] || \
   [ -z "$cursor" ] || [ "$cursor" = "null" ] || \
   [ -z "$b_black" ] || [ "$b_black" = "null" ] || [ -z "$l_black" ] || [ "$l_black" = "null" ] || \
   [ -z "$b_red" ] || [ "$b_red" = "null" ] || [ -z "$l_red" ] || [ "$l_red" = "null" ] || \
   [ -z "$b_green" ] || [ "$b_green" = "null" ] || [ -z "$l_green" ] || [ "$l_green" = "null" ] || \
   [ -z "$b_yellow" ] || [ "$b_yellow" = "null" ] || [ -z "$l_yellow" ] || [ "$l_yellow" = "null" ] || \
   [ -z "$b_blue" ] || [ "$b_blue" = "null" ] || [ -z "$l_blue" ] || [ "$l_blue" = "null" ] || \
   [ -z "$b_magenta" ] || [ "$b_magenta" = "null" ] || [ -z "$l_magenta" ] || [ "$l_magenta" = "null" ] || \
   [ -z "$b_cyan" ] || [ "$b_cyan" = "null" ] || [ -z "$l_cyan" ] || [ "$l_cyan" = "null" ] || \
   [ -z "$b_white" ] || [ "$b_white" = "null" ] || [ -z "$l_white" ] || [ "$l_white" = "null" ]; then

    dataVerified=false

  else 

    dataVerified=true

  fi

}



#______     _                 
#|  _  \   | |                
#| | | |___| |__  _   _  __ _ 
#| | | / _ \ '_ \| | | |/ _` |
#| |/ /  __/ |_) | |_| | (_| |
#|___/ \___|_.__/ \__,_|\__, |
#                        __/ |
#                       |___/ 
function debug_Message () {
  if [[ "$trigg_debug" == true ]]; then
    if [[ ! -z $1 ]]; then 
      echo -e "$1"
    fi
  else 
    if [[ ! -z $2 ]]; then 
      echo -e "$2"
    fi
  fi
}



#______                          _                 _           
#|  _  \                        | |               (_)          
#| | | |___ _ __   ___ _ __   __| | ___ _ __   ___ _  ___  ___ 
#| | | / _ \ '_ \ / _ \ '_ \ / _` |/ _ \ '_ \ / __| |/ _ \/ __|
#| |/ /  __/ |_) |  __/ | | | (_| |  __/ | | | (__| |  __/\__ \
#|___/ \___| .__/ \___|_| |_|\__,_|\___|_| |_|\___|_|\___||___/
#          | |                                                 
#          |_|                                                 
function verify_Dependencies () {

  # Dependency : yq
  if ! command -v yq &> /dev/null; then
    echo -e "$cW│   $cY└──$cR ¤ Error : Missing Depdencencie : $cC yq $Rs"
    exit_Code 1
  fi 

  # Dependency : taplo
  if ! command taplo --version &> /dev/null; then
    echo -e "$cW│   $cY└──$cR ¤ Error : Missing Depdencencie : $cC taplo $Rs"
    exit_Code 1
  fi 

}


                                                                                               
#          88888888ba                                                                                
#          88      "8b                                                                               
#          88      ,8P                                                                               
#          88aaaaaa8P'  ,adPPYYba,  8b,dPPYba,  ,adPPYYba,  88,dPYba,,adPYba,   ,adPPYba,            
#aaaaaaaa  88""""""'    ""     `Y8  88P'   "Y8  ""     `Y8  88P'   "88"    "8a  I8[    ""  aaaaaaaa  
#""""""""  88           ,adPPPPP88  88          ,adPPPPP88  88      88      88   `"Y8ba,   """"""""  
#          88           88,    ,88  88          88,    ,88  88      88      88  aa    ]8I            
#          88           `"8bbdP"Y8  88          `"8bbdP"Y8  88      88      88  `"YbbdP"'            
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

        arg_position=$index
        ((arg_position++))
        ;;
      THIS)
        type_of_param="THIS"

        ((params_used++))

        ;;
      BADDIES)
        type_of_param="BADDIES"

        param_with_args_was_used=true

        ((params_used++))
        
        arg_position=$index
        ((arg_position++))
        ;;
      SHOW)
        type_of_param="SHOW"

        param_with_args_was_used=true

        ((params_used++))

        arg_position=$index
        ((arg_position++))
        ;;
      "--debug")
        trigg_debug=true
        ;;
      "-d")
        trigg_debug=true
        ;;
      "--help")
        trigg_help=true
        ;;
      "-h")
        trigg_help=true
        ;;
      "--get")
        trigg_get=true
        ;;
      "--rm")
        trigg_rm=true
        ;;
      "--install")
        trigg_install=true
        triggers_used=true
        ;;
      "--convert")
        trigg_convert=true
        triggers_used=true
        ;;
      "--kitty")
        format_kitty=true
        formats_used=true
        ;;
      "--all")
        trigg_all=true
        formats_used=true
        ;;
      "-a")
        trigg_all=true
        formats_used=true
        ;;
      "--xresources")
        format_xresources=true
        formats_used=true
        ;;
      "--alacritty")
        format_alacritty=true
        formats_used=true
        ;; 
      "--oso")
        format_osoB16=true
        formats_used=true
        ;;
      "--termite")
        format_Termite=true
        formats_used=true
        ;; 
      "--termux")
        format_Termux=true
        formats_used=true
        ;; 
      "--linuxtty")
        format_LinuxTTY=true
        formats_used=true
        ;; 
    esac

  done 

  # prevent double param
  if [[ "$params_used" > 1 ]]; then
    echo -e "$cW│   $cB└──$cR ¤ Error : More than one MAIN Param.$Rs" 
    exit_Code 2
  fi

  # save args
  if [[ "$param_with_args_was_used" == true ]]; then
    # save arg
    file_arg="${!arg_position}"
  fi

  # verify if args isn't a trigger
  if [[ "$file_arg" == *"--help"* || "$file_arg" == *"--debug"* || "$file_arg" == *"--get"* || "$file_arg" == *"--rm"* || "$file_arg" == *"--install"* || "$file_arg" == *"--kitty"* ]]; then
    echo -e "$cW│   $cB└──$cR ¤ Error : Using a trigger like the <file> arg $Rs"
    exit_Code 9
  fi


  # verify missing args
  if [[ "$param_with_args_was_used" == true && "$file_arg" == "" ]]; then
    echo -e "$cW│   $cB└──$cR ¤ Error : Missing Arguments \`$type_of_param <file>\` $Rs"
    exit_Code 4
  fi

  

}


                                                                                                                    
#         ad88888ba                                                                                                  
#        d8"     "8b                                                                                                 
#        Y8,                                                                                                         
#        `Y8aaaaa,     ,adPPYba,  ,adPPYYba,  8b,dPPYba,   8b,dPPYba,    ,adPPYba,  8b,dPPYba,  ,adPPYba,            
#aaaaaaaa  `"""""8b,  a8"     ""  ""     `Y8  88P'   `"8a  88P'   `"8a  a8P_____88  88P'   "Y8  I8[    ""  aaaaaaaa  
#""""""""        `8b  8b          ,adPPPPP88  88       88  88       88  8PP"""""""  88           `"Y8ba,   """"""""  
#        Y8a     a8P  "8a,   ,aa  88,    ,88  88       88  88       88  "8b,   ,aa  88          aa    ]8I            
#         "Y88888P"    `"Ybbd8"'  `"8bbdP"Y8  88       88  88       88   `"Ybbd8"'  88          `"YbbdP"'   



# _____            _      ______  __    ____ 
#|  _  |          ( )     | ___ \/  |  / ___|
#| | | | ___  ___ |/ ___  | |_/ /`| | / /___ 
#| | | |/ __|/ _ \  / __| | ___ \ | | | ___ \
#\ \_/ /\__ \ (_) | \__ \ | |_/ /_| |_| \_/ |
# \___/ |___/\___/  |___/ \____/ \___/\_____/
function OsoB16_Scanner () {

   debug_Message "$cW│   $cR│   $cC│   $cB├── $cC¤ Executing Oso's Base16 scanner... $Rs"

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

    debug_Message "$cW│   $cR│   $cC│   $cB│   $cC└── $cG¤ Oso's Base16 format detected! $Rs"
   
    file_type_detected=true
    file_type="OsoB16"

  fi

}



#  ________              .__     
# /  _____/  ____   ____ |  |__  
#/   \  ___ /  _ \ / ___\|  |  \ 
#\    \_\  (  <_> ) /_/  >   Y  \
# \______  /\____/\___  /|___|  /
#        \/      /_____/      \/ 
function gogh_Scanner () {

   debug_Message "$cW│   $cR│   $cC│   $cB├── $cC¤ Executing Gogh scanner... $Rs"

  if grep -qE 'background:' "$1" &&
   grep -qE 'foreground:' "$1" &&
   grep -qE 'cursor:' "$1" &&
   grep -qE 'color_01:' "$1" &&
   grep -qE 'color_02:' "$1" &&
   grep -qE 'color_03:' "$1" &&
   grep -qE 'color_04:' "$1" &&
   grep -qE 'color_05:' "$1" &&
   grep -qE 'color_06:' "$1" &&
   grep -qE 'color_07:' "$1" &&
   grep -qE 'color_08:' "$1" &&
   grep -qE 'color_09:' "$1" &&
   grep -qE 'color_10:' "$1" &&
   grep -qE 'color_11:' "$1" &&
   grep -qE 'color_12:' "$1" &&
   grep -qE 'color_13:' "$1" &&
   grep -qE 'color_14:' "$1" &&
   grep -qE 'color_15:' "$1" &&
   grep -qE 'color_16:' "$1"
  then

    debug_Message "$cW│   $cR│   $cC│   $cB│   $cC└── $cG¤ Gogh format detected! $Rs"
   
    file_type_detected=true
    file_type="Gogh"

  fi

}



#__________                      ____  ________
#\______   \_____    ______ ____/_   |/  _____/
# |    |  _/\__  \  /  ___// __ \|   /   __  \ 
# |    |   \ / __ \_\___ \\  ___/|   \  |__\  \
# |______  /(____  /____  >\___  >___|\_____  /
#        \/      \/     \/     \/           \/ 
function base16_Scanner () {

   debug_Message "$cW│   $cR│   $cC│   $cB├── $cC¤ Executing Base16 scanner... $Rs"

  if grep -qE 'base00:' "$1" &&
   grep -qE 'base01:' "$1" &&
   grep -qE 'base02:' "$1" &&
   grep -qE 'base03:' "$1" &&
   grep -qE 'base04:' "$1" &&
   grep -qE 'base05:' "$1" &&
   grep -qE 'base06:' "$1" &&
   grep -qE 'base07:' "$1" &&
   grep -qE 'base08:' "$1" &&
   grep -qE 'base09:' "$1" &&
   grep -qE 'base0A:' "$1" &&
   grep -qE 'base0B:' "$1" &&
   grep -qE 'base0C:' "$1" &&
   grep -qE 'base0D:' "$1" &&
   grep -qE 'base0E:' "$1" &&
   grep -qE 'base0F:' "$1"
  then

    debug_Message "$cW│   $cR│   $cC│   $cB│   $cC└── $cG¤ Base16 format detected! $Rs"
   
    file_type_detected=true
    file_type="Base16"

  fi

}



#__   ________                                        
#\ \ / /| ___ \                                       
# \ V / | |_/ /___  ___  ___  _   _ _ __ ___ ___  ___ 
# /   \ |    // _ \/ __|/ _ \| | | | '__/ __/ _ \/ __|
#/ /^\ \| |\ \  __/\__ \ (_) | |_| | | | (_|  __/\__ \
#\/   \/\_| \_\___||___/\___/ \__,_|_|  \___\___||___/
function XResources_Scanner () {

  debug_Message "$cW│   $cR│   $cC│   $cB├── $cC¤ Executing XResources scanner... $Rs"

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

    debug_Message "$cW│   $cR│   $cC│   $cB│   $cC└── $cG¤ XResources format detected! $Rs"

    file_type_detected=true
    file_type="XResources"

  fi

}



# _   ___ _   _         
#| | / (_) | | |        
#| |/ / _| |_| |_ _   _ 
#|    \| | __| __| | | |
#| |\  \ | |_| |_| |_| |
#\_| \_/_|\__|\__|\__, |
#                  __/ |
#                 |___/ 
function Kitty_Scanner () {

   debug_Message "$cW│   $cR│   $cC│   $cB├── $cC¤ Executing Kitty scanner... $Rs"

  if grep -qE '^\s*foreground' "$1" &&
   grep -qE '^\s*background' "$1" &&
   grep -qE '^\s*cursor' "$1" &&
   grep -qE '^\s*color0' "$1" &&
   grep -qE '^\s*color1' "$1" &&
   grep -qE '^\s*color2' "$1" &&
   grep -qE '^\s*color3' "$1" &&
   grep -qE '^\s*color4' "$1" &&
   grep -qE '^\s*color5' "$1" &&
   grep -qE '^\s*color6' "$1" &&
   grep -qE '^\s*color7' "$1" &&
   grep -qE '^\s*color8' "$1" &&
   grep -qE '^\s*color9' "$1" &&
   grep -qE '^\s*color10' "$1" &&
   grep -qE '^\s*color11' "$1" &&
   grep -qE '^\s*color12' "$1" &&
   grep -qE '^\s*color13' "$1" &&
   grep -qE '^\s*color14' "$1" &&
   grep -qE '^\s*color15' "$1"
  then

    debug_Message "$cW│   $cR│   $cC│   $cB│   $cC└── $cG¤ Kitty format detected! $Rs"
   
    file_type_detected=true
    file_type="Kitty"

  fi

}


#  ___  _                 _ _   _         
# / _ \| |               (_) | | |        
#/ /_\ \ | __ _  ___ _ __ _| |_| |_ _   _ 
#|  _  | |/ _` |/ __| '__| | __| __| | | |
#| | | | | (_| | (__| |  | | |_| |_| |_| |
#\_| |_/_|\__,_|\___|_|  |_|\__|\__|\__, |
#                                    __/ |
#                                   |___/ 
function Alacritty_Scanner () {

   debug_Message "$cW│   $cR│   $cC│   $cB├── $cC¤ Executing Alacritty scanner... $Rs"

  if grep -qE '^\s*\[colors\.primary\]' "$1" &&
   grep -qE '^\s*foreground\s*=' "$1" &&
   grep -qE '^\s*background\s*=' "$1" &&
   grep -qE '^\s*\[colors\.cursor\]' "$1" &&
   grep -qE '^\s*cursor\s*=' "$1" &&
   grep -qE '^\s*\[colors\.normal\]' "$1" &&
   grep -qE '^\s*black\s*=' "$1" &&
   grep -qE '^\s*red\s*=' "$1" &&
   grep -qE '^\s*green\s*=' "$1" &&
   grep -qE '^\s*yellow\s*=' "$1" &&
   grep -qE '^\s*blue\s*=' "$1" &&
   grep -qE '^\s*magenta\s*=' "$1" &&
   grep -qE '^\s*cyan\s*=' "$1" &&
   grep -qE '^\s*white\s*=' "$1" &&
   grep -qE '^\s*\[colors\.bright\]' "$1"
  then

    debug_Message "$cW│   $cR│   $cC│   $cB│   $cC└── $cG¤ Alacritty format detected! $Rs"
   
    file_type_detected=true
    file_type="Alacritty"

  fi

}



# _____              
#|  ___|             
#| |____  _____  ___ 
#|  __\ \/ / _ \/ __|
#| |___>  <  __/ (__ 
#\____/_/\_\___|\___|
function exec_Scanners () {

  echo -e "$cW│   $cR│   $cC├── $cB¤ Scanning file :$cW $1 $cB: ...$Rs"
  file_type_detected=false

  #XResources Scanner
  if [[ "$file_type_detected" == false ]]; then
    XResources_Scanner $1
  fi

  # Oso's Base16 Scanner
  if [[ "$file_type_detected" == false ]]; then
    OsoB16_Scanner $1
  fi

  #Gogh
  if [[ "$file_type_detected" == false ]]; then
    gogh_Scanner $1
  fi

  #Base16
  if [[ "$file_type_detected" == false ]]; then
    base16_Scanner $1
  fi

  #Kitty
  if [[ "$file_type_detected" == false ]]; then
    Kitty_Scanner $1
  fi

  #Alacritty
  if [[ "$file_type_detected" == false ]]; then
    Alacritty_Scanner $1
  fi

  #Format message
  if [[ "$file_type_detected" == true ]]; then

    echo -e "$cW│   $cR│   $cC│   $cB└── $cG¤ :$cW $file_type $cG: Format detected!  $Rs"

  else

    echo -e "$cW│   $cR│   $cC│   $cB└── $cR¤ Can't identify format in file :$cW $1 $cR...   $Rs"    

  fi

}



                                                                                             
#          88888888ba               88                                                        
#          88      "8b              ""                ,d                                      
#          88      ,8P                                88                                      
#          88aaaaaa8P'  8b,dPPYba,  88  8b,dPPYba,  MM88MMM  ,adPPYba,  8b,dPPYba,            
#aaaaaaaa  88""""""'    88P'   "Y8  88  88P'   `"8a   88    a8P_____88  88P'   "Y8  aaaaaaaa  
#""""""""  88           88          88  88       88   88    8PP"""""""  88          """"""""  
#          88           88          88  88       88   88,   "8b,   ,aa  88                    
#          88           88          88  88       88   "Y888  `"Ybbd8"'  88                    
function print_Colors () {

  echo -e "$cW│   $cR│   $cC├── $cB¤ Colors : $Rs"

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
$(printf "$cW│   $cR│   $cC│   $cB│ $Rs Background : \e[48;2;${rBackground};${gBackground};${bBackground}m    $Rs | Foreground : \e[48;2;${rForeground};${gForeground};${bForeground}m    $Rs 
$cW│   $cR│   $cC│   $cB│
$cW│   $cR│   $cC│   $cB│ $Rs bBlack     : \e[48;2;${rBBlack};${gBBlack};${bBBlack}m    $Rs | lBlack     : \e[48;2;${rLBlack};${gLBlack};${bLBlack}m    $Rs
$cW│   $cR│   $cC│   $cB│ $Rs bRed       : \e[48;2;${rBRed};${gBRed};${bBRed}m    $Rs | lRed       : \e[48;2;${rLRed};${gLRed};${bLRed}m    $Rs
$cW│   $cR│   $cC│   $cB│ $Rs bGreen     : \e[48;2;${rBGreen};${gBGreen};${bBGreen}m    $Rs | lGreen     : \e[48;2;${rLGreen};${gLGreen};${bLGreen}m    $Rs
$cW│   $cR│   $cC│   $cB│ $Rs bYellow    : \e[48;2;${rBYellow};${gBYellow};${bBYellow}m    $Rs | lYellow    : \e[48;2;${rLYellow};${gLYellow};${bLYellow}m    $Rs
$cW│   $cR│   $cC│   $cB│ $Rs bBlue      : \e[48;2;${rBBlue};${gBBlue};${bBBlue}m    $Rs | lBlue      : \e[48;2;${rLBlue};${gLBlue};${bLBlue}m    $Rs
$cW│   $cR│   $cC│   $cB│ $Rs bMagenta   : \e[48;2;${rBMagenta};${gBMagenta};${bBMagenta}m    $Rs | lMagenta   : \e[48;2;${rLMagenta};${gLMagenta};${bLMagenta}m    $Rs
$cW│   $cR│   $cC│   $cB│ $Rs bCyan      : \e[48;2;${rBCyan};${gBCyan};${bBCyan}m    $Rs | lCyan      : \e[48;2;${rLCyan};${gLCyan};${bLCyan}m    $Rs
$cW│   $cR│   $cC│   $cB│ $Rs bWhite     : \e[48;2;${rBWhite};${gBWhite};${bBWhite}m    $Rs | lWhite     : \e[48;2;${rLWhite};${gLWhite};${bLWhite}m    $Rs
$cW│   $cR│   $cC│   $cB└────────────────────────────────────────
")
EOF

}




                                                                                                        
#          88888888ba                                   88                                               
#          88      "8b                                  88                                               
#          88      ,8P                                  88                                               
#          88aaaaaa8P'  ,adPPYba,  ,adPPYYba,   ,adPPYb,88   ,adPPYba,  8b,dPPYba,  ,adPPYba,            
#aaaaaaaa  88""""88'   a8P_____88  ""     `Y8  a8"    `Y88  a8P_____88  88P'   "Y8  I8[    ""  aaaaaaaa  
#""""""""  88    `8b   8PP"""""""  ,adPPPPP88  8b       88  8PP"""""""  88           `"Y8ba,   """"""""  
#          88     `8b  "8b,   ,aa  88,    ,88  "8a,   ,d88  "8b,   ,aa  88          aa    ]8I            
#          88      `8b  `"Ybbd8"'  `"8bbdP"Y8   `"8bbdP"Y8   `"Ybbd8"'  88          `"YbbdP"'            



# _____            _      ______  __    ____ 
#|  _  |          ( )     | ___ \/  |  / ___|
#| | | | ___  ___ |/ ___  | |_/ /`| | / /___ 
#| | | |/ __|/ _ \  / __| | ___ \ | | | ___ \
#\ \_/ /\__ \ (_) | \__ \ | |_/ /_| |_| \_/ |
# \___/ |___/\___/  |___/ \____/ \___/\_____/
function OsoB16_Reader() {

  # Save values on variables
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

  # Verify data
  verify_Data
}



# _____             _     
#|  __ \           | |    
#| |  \/ ___   __ _| |__  
#| | __ / _ \ / _` | '_ \ 
#| |_\ \ (_) | (_| | | | |
# \____/\___/ \__, |_| |_|
#              __/ |      
#             |___/       
function Gogh_Reader() {

  background=$(yq -r '.background' "$1" | sed 's/^#//')
  foreground=$(yq -r '.foreground' "$1" | sed 's/^#//')
  cursor=$(yq -r '.cursor' "$1" | sed 's/^#//')

  b_black=$(yq -r '.color_01' "$1" | sed 's/^#//')
  b_red=$(yq -r '.color_02' "$1" | sed 's/^#//')
  b_green=$(yq -r '.color_03' "$1" | sed 's/^#//')
  b_yellow=$(yq -r '.color_04' "$1" | sed 's/^#//')
  b_blue=$(yq -r '.color_05' "$1" | sed 's/^#//')
  b_magenta=$(yq -r '.color_06' "$1" | sed 's/^#//')
  b_cyan=$(yq -r '.color_07' "$1" | sed 's/^#//')
  b_white=$(yq -r '.color_08' "$1" | sed 's/^#//')

  l_black=$(yq -r '.color_09' "$1" | sed 's/^#//')
  l_red=$(yq -r '.color_10' "$1" | sed 's/^#//')
  l_green=$(yq -r '.color_11' "$1" | sed 's/^#//')
  l_yellow=$(yq -r '.color_12' "$1" | sed 's/^#//')
  l_blue=$(yq -r '.color_13' "$1" | sed 's/^#//')
  l_magenta=$(yq -r '.color_14' "$1" | sed 's/^#//')
  l_cyan=$(yq -r '.color_15' "$1" | sed 's/^#//')
  l_white=$(yq -r '.color_16' "$1" | sed 's/^#//')

  # Verify data
  verify_Data
}



#______                __    ____ 
#| ___ \              /  |  / ___|
#| |_/ / __ _ ___  ___`| | / /___ 
#| ___ \/ _` / __|/ _ \| | | ___ \
#| |_/ / (_| \__ \  __/| |_| \_/ |
#\____/ \__,_|___/\___\___/\_____/
function Base16_Reader() {

  background=$(yq -r '.base00' "$1" | sed 's/^#//')
  foreground=$(yq -r '.base07' "$1" | sed 's/^#//')
  cursor=$(yq -r '.base07' "$1" | sed 's/^#//')

  b_black=$(yq -r '.base00' "$1" )
  b_red=$(yq -r '.base01' "$1" )
  b_green=$(yq -r '.base02' "$1" )
  b_yellow=$(yq -r '.base03' "$1" )
  b_blue=$(yq -r '.base04' "$1" )
  b_magenta=$(yq -r '.base05' "$1" )
  b_cyan=$(yq -r '.base06' "$1" )
  b_white=$(yq -r '.base07' "$1" )

  l_black=$(yq -r '.base08' "$1" )
  l_red=$(yq -r '.base09' "$1" )
  l_green=$(yq -r '.base0A' "$1" )
  l_yellow=$(yq -r '.base0B' "$1" )
  l_blue=$(yq -r '.base0C' "$1" )
  l_magenta=$(yq -r '.base0D' "$1" )
  l_cyan=$(yq -r '.base0E' "$1" )
  l_white=$(yq -r '.base0F' "$1" )

  # Verify data
  verify_Data
}



#__   ________                                        
#\ \ / /| ___ \                                       
# \ V / | |_/ /___  ___  ___  _   _ _ __ ___ ___  ___ 
# /   \ |    // _ \/ __|/ _ \| | | | '__/ __/ _ \/ __|
#/ /^\ \| |\ \  __/\__ \ (_) | |_| | | | (_|  __/\__ \
#\/   \/\_| \_\___||___/\___/ \__,_|_|  \___\___||___/
function XResources_Reader () {

  # Save values on variables
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

  # Verify data
  verify_Data

}



# _   ___ _   _         
#| | / (_) | | |        
#| |/ / _| |_| |_ _   _ 
#|    \| | __| __| | | |
#| |\  \ | |_| |_| |_| |
#\_| \_/_|\__|\__|\__, |
#                  __/ |
#                 |___/ 
function Kitty_Reader () {

  # Save values on variables
  background=$(grep -E '^\s*background' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  foreground=$(grep -E '^\s*foreground' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  cursor=$(grep -E '^\s*cursor' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_black=$(grep -E '^\s*color0' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_black=$(grep -E '^\s*color8' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_red=$(grep -E '^\s*color1\s' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_red=$(grep -E '^\s*color9' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_green=$(grep -E '^\s*color2' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_green=$(grep -E '^\s*color10' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_yellow=$(grep -E '^\s*color3' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_yellow=$(grep -E '^\s*color11' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_blue=$(grep -E '^\s*color4' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_blue=$(grep -E '^\s*color12' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_magenta=$(grep -E '^\s*color5' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_magenta=$(grep -E '^\s*color13' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_cyan=$(grep -E '^\s*color6' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_cyan=$(grep -E '^\s*color14' "$1" | awk '{gsub(/^#/, "", $2); print $2}')

  b_white=$(grep -E '^\s*color7' "$1" | awk '{gsub(/^#/, "", $2); print $2}')
  l_white=$(grep -E '^\s*color15' "$1" | awk '{gsub(/^#/, "", $2); print $2}')


  # Verify data
  verify_Data

}



#  ___  _                 _ _   _         
# / _ \| |               (_) | | |        
#/ /_\ \ | __ _  ___ _ __ _| |_| |_ _   _ 
#|  _  | |/ _` |/ __| '__| | __| __| | | |
#| | | | | (_| | (__| |  | | |_| |_| |_| |
#\_| |_/_|\__,_|\___|_|  |_|\__|\__|\__, |
#                                    __/ |
#                                   |___/ 
function Alacritty_Reader () {

  # Save values on variables
  background=$(taplo get -f $1 'colors.primary.background' | sed 's/^#//')
  foreground=$(taplo get -f $1 'colors.primary.foreground' | sed 's/^#//')

  cursor=$(taplo get -f $1 'colors.cursor.cursor' | sed 's/^#//')

  b_black=$(taplo get -f $1 'colors.normal.black' | sed 's/^#//')
  l_black=$(taplo get -f $1 'colors.bright.black' | sed 's/^#//')

  b_red=$(taplo get -f $1 'colors.normal.red' | sed 's/^#//')
  l_red=$(taplo get -f $1 'colors.bright.red' | sed 's/^#//')

  b_green=$(taplo get -f $1 'colors.normal.green' | sed 's/^#//')
  l_green=$(taplo get -f $1 'colors.bright.green' | sed 's/^#//')

  b_yellow=$(taplo get -f $1 'colors.normal.yellow' | sed 's/^#//')
  l_yellow=$(taplo get -f $1 'colors.bright.yellow' | sed 's/^#//')

  b_blue=$(taplo get -f $1 'colors.normal.blue' | sed 's/^#//')
  l_blue=$(taplo get -f $1 'colors.bright.blue' | sed 's/^#//')

  b_magenta=$(taplo get -f $1 'colors.normal.magenta' | sed 's/^#//')
  l_magenta=$(taplo get -f $1 'colors.bright.magenta' | sed 's/^#//')

  b_cyan=$(taplo get -f $1 'colors.normal.cyan' | sed 's/^#//')
  l_cyan=$(taplo get -f $1 'colors.bright.cyan' | sed 's/^#//')

  b_white=$(taplo get -f $1 'colors.normal.white' | sed 's/^#//')
  l_white=$(taplo get -f $1 'colors.bright.white' | sed 's/^#//')


  # Verify data
  verify_Data

}



# _____              
#|  ___|             
#| |____  _____  ___ 
#|  __\ \/ / _ \/ __|
#| |___>  <  __/ (__ 
#\____/_/\_\___|\___|
function exec_Reader () {

  echo -e "$cW│   $cR│   $cC├── $cB¤ Reading file :$cW $1 $cB: ...$Rs"

  # Reset variables :

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

    "Gogh")
      # Gogh Reader
      Gogh_Reader $1 
      ;;

    "Base16")
      # Base16 Reader
      Base16_Reader $1 
      ;;
    
    "Kitty")
      # Kitty Reader
      Kitty_Reader $1 
      ;;
    
    "Alacritty")
      # Kitty Reader
      Alacritty_Reader $1 
      ;;
      
  esac

}


                                                                                                                                                                                                                         
#        I8,        8        ,8I            88                                                                
#        `8b       d8b       d8'            ""    ,d       ,d                                                 
#         "8,     ,8"8,     ,8"                   88       88                                                 
#          Y8     8P Y8     8P  8b,dPPYba,  88  MM88MMM  MM88MMM  ,adPPYba,  8b,dPPYba,  ,adPPYba,            
#aaaaaaaa  `8b   d8' `8b   d8'  88P'   "Y8  88    88       88    a8P_____88  88P'   "Y8  I8[    ""  aaaaaaaa  
#""""""""   `8a a8'   `8a a8'   88          88    88       88    8PP"""""""  88           `"Y8ba,   """"""""  
#            `8a8'     `8a8'    88          88    88,      88,   "8b,   ,aa  88          aa    ]8I            
#             `8'       `8'     88          88    "Y888    "Y888  `"Ybbd8"'  88          `"YbbdP"'            



# _   ___ _   _         
#| | / (_) | | |        
#| |/ / _| |_| |_ _   _ 
#|    \| | __| __| | | |
#| |\  \ | |_| |_| |_| |
#\_| \_/_|\__|\__|\__, |
#                  __/ |
#                 |___/ 
function writter_Kitty () {
  cat > "$1" <<EOF
# The basic colors
foreground  #$foreground
background  #$background

# Cursor colors
cursor      #$cursor

# black
color0      #$b_black
color8      #$l_black

# red
color1      #$b_red
color9      #$l_red

# green
color2      #$b_green
color10     #$l_green

# yellow
color3      #$b_yellow
color11     #$l_yellow

# blue
color4      #$b_blue
color12     #$l_blue

# magenta
color5      #$b_magenta
color13     #$l_magenta

# cyan
color6      #$b_cyan
color14     #$l_cyan

# white
color7      #$b_white
color15     #$l_white

EOF
}



#  ___  _                 _ _   _         
# / _ \| |               (_) | | |        
#/ /_\ \ | __ _  ___ _ __ _| |_| |_ _   _ 
#|  _  | |/ _` |/ __| '__| | __| __| | | |
#| | | | | (_| | (__| |  | | |_| |_| |_| |
#\_| |_/_|\__,_|\___|_|  |_|\__|\__|\__, |
#                                    __/ |
#                                   |___/ 
function writter_Alacritty () {
  cat > "$1" <<EOF
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
}


# _____            _      ______                  __    ____ 
#|  _  |          ( )     | ___ \                /  |  / ___|
#| | | | ___  ___ |/ ___  | |_/ / __ _ ___  ___  `| | / /___ 
#| | | |/ __|/ _ \  / __| | ___ \/ _` / __|/ _ \  | | | ___ \
#\ \_/ /\__ \ (_) | \__ \ | |_/ / (_| \__ \  __/ _| |_| \_/ |
# \___/ |___/\___/  |___/ \____/ \__,_|___/\___| \___/\_____/
function writter_OsoB16 () {
  cat > "$1" <<EOF
background: "$background"
foreground: "$foreground"
cursor:     "$cursor"

b_black:    "$b_black"
b_red:      "$b_red"
b_green:    "$b_green"
b_yellow:   "$b_yellow"
b_blue:     "$b_blue"
b_magenta:  "$b_magenta"
b_cyan:     "$b_cyan"
b_white:    "$b_white"

l_black:    "$l_black"
l_red:      "$l_red"
l_green:    "$l_green"
l_yellow:   "$l_yellow"
l_blue:     "$l_blue"
l_magenta:  "$l_magenta"
l_cyan:     "$l_cyan"
l_white:    "$l_white"

EOF
}



#__   ________                                        
#\ \ / /| ___ \                                       
# \ V / | |_/ /___  ___  ___  _   _ _ __ ___ ___  ___ 
# /   \ |    // _ \/ __|/ _ \| | | | '__/ __/ _ \/ __|
#/ /^\ \| |\ \  __/\__ \ (_) | |_| | | | (_|  __/\__ \
#\/   \/\_| \_\___||___/\___/ \__,_|_|  \___\___||___/
function writter_XResources () {
  cat > "$1" <<EOF
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
}



# _____                   _ _       
#|_   _|                 (_) |      
#  | | ___ _ __ _ __ ___  _| |_ ___ 
#  | |/ _ \ '__| '_ ` _ \| | __/ _ \
#  | |  __/ |  | | | | | | | ||  __/
#  \_/\___|_|  |_| |_| |_|_|\__\___|
function writter_Termite () {
  cat > "$1" <<EOF
[colors]

# special
foreground      = #$foreground
cursor          = #$cursor
background      = #$background

# black
color0  = #$b_black
color8  = #$l_black

# red
color1  = #$b_red
color9  = #$l_red

# green
color2  = #$b_green
color10 = #$l_green

# yellow
color3  = #$b_yellow
color11 = #$l_yellow

# blue
color4  = #$b_blue
color12 = #$l_blue

# magenta
color5  = #$b_magenta
color13 = #$l_magenta

# cyan
color6  = #$b_cyan
color14 = #$l_cyan

# white
color7  = #$b_white
color15 = #$l_white

EOF
}



# _____                              
#|_   _|                             
#  | | ___ _ __ _ __ ___  _   ___  __
#  | |/ _ \ '__| '_ ` _ \| | | \ \/ /
#  | |  __/ |  | | | | | | |_| |>  < 
#  \_/\___|_|  |_| |_| |_|\__,_/_/\_\
function writter_Termux () {
  cat > "$1" <<EOF
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
}



# _     _                    _____ _______   __
#| |   (_)                  |_   _|_   _\ \ / /
#| |    _ _ __  _   ___  __   | |   | |  \ V / 
#| |   | | '_ \| | | \ \/ /   | |   | |   \ /  
#| |___| | | | | |_| |>  <    | |   | |   | |  
#\_____/_|_| |_|\__,_/_/\_\   \_/   \_/   \_/  
function writter_LinuxTTY () {
  cat > "$1" <<EOF
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
}



#          88                                               88  88                                               
#          88                            ,d                 88  88                                               
#          88                            88                 88  88                                               
#          88  8b,dPPYba,   ,adPPYba,  MM88MMM  ,adPPYYba,  88  88   ,adPPYba,  8b,dPPYba,  ,adPPYba,            
#aaaaaaaa  88  88P'   `"8a  I8[    ""    88     ""     `Y8  88  88  a8P_____88  88P'   "Y8  I8[    ""  aaaaaaaa  
#""""""""  88  88       88   `"Y8ba,     88     ,adPPPPP88  88  88  8PP"""""""  88           `"Y8ba,   """"""""  
#          88  88       88  aa    ]8I    88,    88,    ,88  88  88  "8b,   ,aa  88          aa    ]8I            
#          88  88       88  `"YbbdP"'    "Y888  `"8bbdP"Y8  88  88   `"Ybbd8"'  88          `"YbbdP"'            



# _   ___ _   _         
#| | / (_) | | |        
#| |/ / _| |_| |_ _   _ 
#|    \| | __| __| | | |
#| |\  \ | |_| |_| |_| |
#\_| \_/_|\__|\__|\__, |
#                  __/ |
#                 |___/ 
function installer_Kitty () {

  output_file="$HOME/.config/kitty/theme.conf"
  fileOut=$(basename $output_file)

  debug_Message "$cW│   $cR│   $cC│   $cB│   $cY└──$cM ¤ Installing kitty theme : $fileOut : ... $Rs"

  writter_Kitty "$output_file"

}


                                                                                                                                             
#            ,ad8888ba,                                                                                                                       
#           d8"'    `"8b                                                                   ,d                                                 
#          d8'                                                                             88                                                 
#          88              ,adPPYba,   8b,dPPYba,   8b       d8   ,adPPYba,  8b,dPPYba,  MM88MMM  ,adPPYba,  8b,dPPYba,  ,adPPYba,            
#aaaaaaaa  88             a8"     "8a  88P'   `"8a  `8b     d8'  a8P_____88  88P'   "Y8    88    a8P_____88  88P'   "Y8  I8[    ""  aaaaaaaa  
#""""""""  Y8,            8b       d8  88       88   `8b   d8'   8PP"""""""  88            88    8PP"""""""  88           `"Y8ba,   """"""""  
#           Y8a.    .a8P  "8a,   ,a8"  88       88    `8b,d8'    "8b,   ,aa  88            88,   "8b,   ,aa  88          aa    ]8I            
#            `"Y8888Y"'    `"YbbdP"'   88       88      "8"       `"Ybbd8"'  88            "Y888  `"Ybbd8"'  88          `"YbbdP"'            
                                                                                                                                             


# _   ___ _   _         
#| | / (_) | | |        
#| |/ / _| |_| |_ _   _ 
#|    \| | __| __| | | |
#| |\  \ | |_| |_| |_| |
#\_| \_/_|\__|\__|\__, |
#                  __/ |
#                 |___/ 
function converter_Kitty () {

  fileOut=$(basename $1)

  debug_Message "$cW│   $cR│   $cC│   $cB│   $cY└──$cM ¤ Converting kitty theme : $fileOut : ... $Rs"

  writter_Kitty "$1"

}



#__   ________                                        
#\ \ / /| ___ \                                       
# \ V / | |_/ /___  ___  ___  _   _ _ __ ___ ___  ___ 
# /   \ |    // _ \/ __|/ _ \| | | | '__/ __/ _ \/ __|
#/ /^\ \| |\ \  __/\__ \ (_) | |_| | | | (_|  __/\__ \
#\/   \/\_| \_\___||___/\___/ \__,_|_|  \___\___||___/
function converter_XResources () {

  fileOut=$(basename $1)

  debug_Message "$cW│   $cR│   $cC│   $cB│   $cY└──$cM ¤ Converting XResources theme : $fileOut : ... $Rs"

  writter_XResources "$1"

}



#  ___  _                 _ _   _         
# / _ \| |               (_) | | |        
#/ /_\ \ | __ _  ___ _ __ _| |_| |_ _   _ 
#|  _  | |/ _` |/ __| '__| | __| __| | | |
#| | | | | (_| | (__| |  | | |_| |_| |_| |
#\_| |_/_|\__,_|\___|_|  |_|\__|\__|\__, |
#                                    __/ |
#                                   |___/ 
function converter_Alacritty () {

  fileOut=$(basename $1)

  debug_Message "$cW│   $cR│   $cC│   $cB│   $cY└──$cM ¤ Converting Alacritty theme : $fileOut : ... $Rs"

  writter_Alacritty "$1"

}



# _____            _      ______                __    ____ 
#|  _  |          ( )     | ___ \              /  |  / ___|
#| | | | ___  ___ |/ ___  | |_/ / __ _ ___  ___`| | / /___ 
#| | | |/ __|/ _ \  / __| | ___ \/ _` / __|/ _ \| | | ___ \
#\ \_/ /\__ \ (_) | \__ \ | |_/ / (_| \__ \  __/| |_| \_/ |
# \___/ |___/\___/  |___/ \____/ \__,_|___/\___\___/\_____/
function converter_OsoB16 () {

  fileOut=$(basename $1)

  debug_Message "$cW│   $cR│   $cC│   $cB│   $cY└──$cM ¤ Converting Oso's Base16 theme : $fileOut : ... $Rs"

  writter_OsoB16 "$1"

}  



# _____                   _ _       
#|_   _|                 (_) |      
#  | | ___ _ __ _ __ ___  _| |_ ___ 
#  | |/ _ \ '__| '_ ` _ \| | __/ _ \
#  | |  __/ |  | | | | | | | ||  __/
#  \_/\___|_|  |_| |_| |_|_|\__\___|
function converter_Termite () {

  fileOut=$(basename $1)

  debug_Message "$cW│   $cR│   $cC│   $cB│   $cY└──$cM ¤ Converting Termite theme : $fileOut : ... $Rs"

  writter_Termite "$1"

}  



# _____                              
#|_   _|                             
#  | | ___ _ __ _ __ ___  _   ___  __
#  | |/ _ \ '__| '_ ` _ \| | | \ \/ /
#  | |  __/ |  | | | | | | |_| |>  < 
#  \_/\___|_|  |_| |_| |_|\__,_/_/\_\
function converter_Termux () {

  fileOut=$(basename $1)

  debug_Message "$cW│   $cR│   $cC│   $cB│   $cY└──$cM ¤ Converting termux theme : $fileOut : ... $Rs"

  writter_Termux "$1"

} 



# _     _                    _____ _______   __
#| |   (_)                  |_   _|_   _\ \ / /
#| |    _ _ __  _   ___  __   | |   | |  \ V / 
#| |   | | '_ \| | | \ \/ /   | |   | |   \ /  
#| |___| | | | | |_| |>  <    | |   | |   | |  
#\_____/_|_| |_|\__,_/_/\_\   \_/   \_/   \_/  
function converter_LinuxTTY () {

  fileOut=$(basename $1)

  debug_Message "$cW│   $cR│   $cC│   $cB│   $cY└──$cM ¤ Converting Linux TTY theme : $fileOut : ... $Rs"

  writter_LinuxTTY "$1"

} 



#     888888888888         88                                                                         
#          88              ""                                                                         
#          88                                                                                         
#          88  8b,dPPYba,  88   ,adPPYb,d8   ,adPPYb,d8   ,adPPYba,  8b,dPPYba,  ,adPPYba,            
#aaaaaaaa  88  88P'   "Y8  88  a8"    `Y88  a8"    `Y88  a8P_____88  88P'   "Y8  I8[    ""  aaaaaaaa  
#""""""""  88  88          88  8b       88  8b       88  8PP"""""""  88           `"Y8ba,   """"""""  
#          88  88          88  "8a,   ,d88  "8a,   ,d88  "8b,   ,aa  88          aa    ]8I            
#          88  88          88   `"YbbdP"Y8   `"YbbdP"Y8   `"Ybbd8"'  88          `"YbbdP"'            
#                               aa,    ,88   aa,    ,88                                               
#                                "Y8bbdP"     "Y8bbdP"                                                



# _____      _    ______ _ _      
#|  __ \    | |   |  ___(_) |     
#| |  \/ ___| |_  | |_   _| | ___ 
#| | __ / _ \ __| |  _| | | |/ _ \
#| |_\ \  __/ |_  | |   | | |  __/
# \____/\___|\__| \_|   |_|_|\___|
function get_File () {

  if [[ "$trigg_get" == true ]]; then

    echo -e "$cW├── $cG¤ Getting file...$Rs"

    status_code=$(curl -s -o /dev/null -w "%{http_code}" "$1")
    if [[ "$status_code" == 200 ]]; then

      bsname=$(basename "$1")

      curl -sSL -o "$bsname" "$1"

      file_arg="$bsname"

      canDownload=true

    else 

      echo -e "$cW│   $cG└─ $cR¤ ERROR : can't access to the file...$Rs"

    fi

  fi
}



#______                               ______ _ _      
#| ___ \                              |  ___(_) |     
#| |_/ /___ _ __ ___   _____   _____  | |_   _| | ___ 
#|    // _ \ '_ ` _ \ / _ \ \ / / _ \ |  _| | | |/ _ \
#| |\ \  __/ | | | | | (_) \ V /  __/ | |   | | |  __/
#\_| \_\___|_| |_| |_|\___/ \_/ \___| \_|   |_|_|\___|
function remove_file () {

  if [[ "$trigg_rm" == true ]]; then

    rm "$file_arg"

  fi
}



# _____              
#|  ___|             
#| |____  _____  ___ 
#|  __\ \/ / _ \/ __|
#| |___>  <  __/ (__ 
#\____/_/\_\___|\___|           
function exec_Triggers () {

  if [[ $trigg_all == true ]]; then

    # Activate all formats
    format_kitty=true
    format_xresources=true
    format_alacritty=true
    format_osoB16=true
    format_Termite=true
    format_Termux=true
    format_LinuxTTY=true
    
  fi

  echo -e "$cW│   $cR│   $cC├── $cB¤ Executing triggers...$Rs"

  if [[ $triggers_used == false ]]; then
    echo -e "$cW│   $cR│   $cC│   $cB└──$cR ¤ No triggers detected...$Rs"
    
  else 

    # installers
    if [[ "$trigg_install" == true ]]; then

      echo -e "$cW│   $cR│   $cC│   $cB├──$cY ¤ Trigger : Installing... $Rs"

      if [[ "$formats_used" == true ]]; then

        # Kitty
        if [[ "$format_kitty" == true ]]; then
          installer_Kitty
        fi

      else
        debug_Message "$cW│   $cR│   $cC│   $cB│   $cY└──$cR ¤ No formats to install... $Rs"
      fi

    fi

    #Converters
    if [[ "$trigg_convert" == true ]]; then

      echo -e "$cW│   $cR│   $cC│   $cB├──$cY ¤ Trigger : convert... $Rs"

      if [[ "$formats_used" == true ]]; then

        # Kitty
        if [[ "$format_kitty" == true ]]; then
          output_file="$bsname-Kitty.conf"
          converter_Kitty "$output_file"
        fi

        # XResources
        if [[ "$format_xresources" == true ]]; then
          output_file="$bsname-XResources.XResources"
          converter_XResources "$output_file"
        fi

        # Alacritty
        if [[ "$format_alacritty" == true ]]; then
          output_file="$bsname-Alacritty.toml"
          converter_Alacritty "$output_file"
        fi

        # Oso's Base16
        if [[ "$format_osoB16" == true ]]; then
          output_file="$bsname-osoB16.yaml"
          converter_OsoB16 "$output_file"
        fi

        # Termite
        if [[ "$format_Termite" == true ]]; then
          output_file="$bsname-Termite"
          converter_Termite "$output_file"
        fi

        # Termux
        if [[ "$format_Termux" == true ]]; then
          output_file="$bsname-Termux.properties"
          converter_Termux "$output_file"
        fi

        # Linux TTY
        if [[ "$format_LinuxTTY" == true ]]; then
          output_file="$bsname-LinuxTTY.sh"
          converter_LinuxTTY "$output_file"
        fi

        

      else
        debug_Message "$cW│   $cR│   $cC│   $cB│   $cY└──$cR ¤ No formats to convert... $Rs"
      fi


    fi


    echo -e "$cW│   $cR│   $cC│   $cB└── ¤ All triggers executed! $Rs"

  fi

  

  # si se ejecute el trigger --install, habilita a que se ejecuten los 

}


                                                                                                                              
#          88888888888                                                                                                         
#          88                                                              ,d                                                  
#          88                                                              88                                                  
#          88aaaaa      8b,     ,d8  ,adPPYba,   ,adPPYba,  88       88  MM88MMM  ,adPPYba,   8b,dPPYba,  ,adPPYba,            
#aaaaaaaa  88"""""       `Y8, ,8P'  a8P_____88  a8"     ""  88       88    88    a8"     "8a  88P'   "Y8  I8[    ""  aaaaaaaa  
#""""""""  88              )888(    8PP"""""""  8b          88       88    88    8b       d8  88           `"Y8ba,   """"""""  
#          88            ,d8" "8b,  "8b,   ,aa  "8a,   ,aa  "8a,   ,a88    88,   "8a,   ,a8"  88          aa    ]8I            
#          88888888888  8P'     `Y8  `"Ybbd8"'   `"Ybbd8"'   `"YbbdP'Y8    "Y888  `"YbbdP"'   88          `"YbbdP"'                                                                                                                                  
function exec_FILE () {

  #get the file
  get_File $file_arg
  if [[ "$canDownload"  == false && "$trigg_get" == true ]]; then
    exit_Code 10
  fi

  echo -e "$cW├── $cR¤ Executing \"FILE\" process...$Rs"
  echo -e "$cW│   $cR├── $cC¤ Proccessing file :$cW $file_arg $cC: ...$Rs"

  #Verify the file
  verify_File_whit_Exit $file_arg

  #Save base name
  bsname="${file_arg%.*}"

  # Scannn the file
  exec_Scanners $file_arg

  # Read the file
  if [[ "$file_type_detected" == true ]]; then
    exec_Reader $file_arg $file_type
  else 
    exit_Code 6
  fi


  # verificar data
  if [[ "$dataVerified" == false ]]; then 
    echo -e "$cW│   $cR│   $cC│   $cB└── $cR¤ ERROR : Missing or null values...$Rs"
    echo -e "$cW│   $cR│   $cC└────────"
    echo -e "$cW│   $cR└─────────────"
    exit_Code 4
  fi

  # Show colors
  print_Colors

  # Exec triggers...
  exec_Triggers
  echo -e "$cW│   $cR│   $cC└─────────$Rs"
  echo -e "$cW│   $cR└──────────────$Rs"

  #remove the file?
  remove_file

}

function exec_THIS () {

  echo -e "$cW├── $cR¤ Executing \"THIS\" process...$Rs"

}

function exec_BADDIES () {

  echo -e "$cW├── $cR¤ Executing \"BADDIES\" process...$Rs"

}

function exec_SHOW () {

  #get the file
  get_File $file_arg
  if [[ "$canDownload"  == false && "$trigg_get" == true ]]; then
    exit_Code 10
  fi

  echo -e "$cW├── $cR¤ Executing \"SHOW\" process...$Rs"
  echo -e "$cW│   $cR├── $cC¤ Proccessing file :$cW $file_arg $cC: ...$Rs"

  #Verify the file
  verify_File_whit_Exit $file_arg

  #Save base name
  bsname="${file_arg%.*}"

  # Scann the file
  exec_Scanners $file_arg

  # Read the file
  if [[ "$file_type_detected" == true ]]; then
    exec_Reader $file_arg $file_type
  else 
    echo -e "$cW│   $cR│   $cC└────────" 
    echo -e "$cW│   $cR└─────────────" 
    exit_Code 6
  fi

  # verificar data
  if [[ "$dataVerified" == false ]]; then 
    echo -e "$cW│   $cR│   $cC│   $cB└── $cR¤ ERROR : Missing or null values...$Rs"
    echo -e "$cW│   $cR│   $cC└────────"
    echo -e "$cW│   $cR└─────────────"
    exit_Code 4
  fi

  # Show colors
  print_Colors
  echo -e "$cW│   $cR│   $cC└─────────────────────────────────────────────"
  echo -e "$cW│   $cR└──────────────────────────────────────────────────"


  #remove the file?
  remove_file

  exit_Code 0

}

function exec_Engine () {

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
    
    "SHOW")
      exec_SHOW
      ;;

  esac

}


                                                                    
#          88b           d88              88                         
#          888b         d888              ""                         
#          88`8b       d8'88                                         
#          88 `8b     d8' 88  ,adPPYYba,  88  8b,dPPYba,             
#aaaaaaaa  88  `8b   d8'  88  ""     `Y8  88  88P'   `"8a  aaaaaaaa  
#""""""""  88   `8b d8'   88  ,adPPPPP88  88  88       88  """"""""  
#          88    `888'    88  88,    ,88  88  88       88            
#          88     `8'     88  `"8bbdP"Y8  88  88       88            
cat <<EOF
$(printf "
$cR _______       __                   _______                                        
|   _   .-----|  .-----.----.______|   _   .----.-----.----.-----.-----.-----.----.
|.  1___|  _  |  |  _  |   _|______|.  1   |   _|  _  |  __|  -__|__ --|  _  |   _|
|.  |___|_____|__|_____|__|        |.  ____|__| |_____|____|_____|_____|_____|__|  
|:  1   |                          |:  |                                           
|::.. . |                          |::.|                                           
\`-------'                          \`---'  $Rs 
") 
EOF
echo -e "$cW¤ Welcome!$Rs"

echo -e "$cW├── $cB¤ Verifiying params...$Rs"
verify_Params $@ 

help_Message 

echo -e "$cW├── $cB¤ Verifiying dependencies...$Rs"
verify_Dependencies

exec_Engine

exit_Code 0