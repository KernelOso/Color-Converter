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

# File verify
file_type_detected=false
file_type=""
are_missing_values=false

# esc characters
bRED="\033[0;31m"
bGREEN="\033[0;32m"
bYELLOW="\033[0;33m"
bBLUE="\033[0;34m"
bMAGN="\033[0;35m"
bCYAN="\033[0;36m"
bWHITE="\033[0;37m"
Reset="\033[0m"

#triggers :
triggers_used=false

trigg_debug=false
trigg_help=false

trigg_get=false
trigg_rm=false

trigg_install=false
trigg_convert=false

#formats
output_file=""

formats_used=false

format_kitty=false

# triggers values : 

  # trigg preserv name : 
  original_name=""

#Files verification
fileExist=false
fileEmpty=false
fileAccess=false
dataVerified=false
canDownload=false

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
  echo -e "$bWHITE└── ¤ Exiting whit code :  $1 $Reset"

  case "$1" in

    # 0 : no errors
    "0")
      echo -e "    $bWHITE└── $bGREEN¤ No Errors! $Reset"
    ;;

    # 1 : missing dependency
    "1")
      echo -e "    $bWHITE└── $bRED¤ ERROR : Missing dependencies $Reset"
    ;;

    # 2 : more than 1 param
    "2")
      echo -e "    $bWHITE└── $bRED¤ ERROR : More than 1 param $Reset"
    ;;

    # 3 : missing arg
    "3")
      echo -e "    $bWHITE└── $bRED¤ ERROR : Missing arguments $Reset"
    ;;

    # 4 : missing values
    "4")
      echo -e "    $bWHITE└── $bRED¤ ERROR : Missing data values $Reset"
    ;;

    # 5 : empty file
    "5")
      echo -e "    $bWHITE└── $bRED¤ ERROR : Empty file $Reset"
    ;;

    # 6 : color-scheme format undetected
    "6")
      echo -e "    $bWHITE└── $bRED¤ ERROR : color-scheme format undetected $Reset"
    ;;

    # 7 : file doesn't exist
    "7")
      echo -e "    $bWHITE└── $bRED¤ ERROR : File doesn't exits $Reset"
    ;;

    # 8 : unaccsesbile file
    "8")
      echo -e "    $bWHITE└── $bRED¤ ERROR : Unaccsesible file $Reset"
    ;;

    # 9 : ussing a trigger like an arg
    "9")
      echo -e "    $bWHITE└── $bRED¤ ERROR : Using a trigger like an argument $Reset"
    ;;

    "10")
      echo -e "    $bWHITE└─ $bRED¤ ERROR : can't access to the file...$Reset"
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
    echo -e "$bWHITE├── $bCYAN¤ Help Message : $Reset"
    cat <<EOF
$(printf "$bWHITE│   $bCYAN╔════════════════════$Reset  
$bWHITE│   $bCYAN║$Reset  Color-Procesor : A color-scheme converter tool!
$bWHITE│   $bCYAN║$Reset
$bWHITE│   $bCYAN║$Reset $bMAGN #Dependencies :
$bWHITE│   $bCYAN║$Reset
$bWHITE│   $bCYAN║$Reset    ¤$bMAGN Bash
$bWHITE│   $bCYAN║$Reset    ¤$bMAGN yq
$bWHITE│   $bCYAN║$Reset
$bWHITE│   $bCYAN║$Reset $bBLUE # Usage : 
$bWHITE│   $bCYAN║$Reset    
$bWHITE│   $bCYAN║$Reset   $bBLUE Color-Converter.sh $bCYAN[help(s)] $bRED[process] $bWHITE| $bRED[process] $bCYAN[help(s)] $Reset
$bWHITE│   $bCYAN║$Reset
$bWHITE│   $bCYAN║$Reset $bCYAN ## Helps :
$bWHITE│   $bCYAN║$Reset    
$bWHITE│   $bCYAN║$Reset    ¤$bCYAN [ -h | --help ]  $bWHITE :  $bCYAN Show THIS manual.
$bWHITE│   $bCYAN║$Reset    ¤$bCYAN [ -d | --debug ] $bWHITE :  $bCYAN Show the extra debug messages.
$bWHITE│   $bCYAN║$Reset    
$bWHITE│   $bCYAN║$Reset $bRED ## Processes :
$bWHITE│   $bCYAN║$Reset    
$bWHITE│   $bCYAN║$Reset    ¤$bRED SHOW $bWHITE<file> $bYELLOW[trigger(s)] $bWHITE :$bRED Only SHOW the information in one $bWHITE<file>$bRED.
$bWHITE│   $bCYAN║$Reset    ¤$bRED FILE $bWHITE<file> $bYELLOW[trigger(s)] $bWHITE :$bRED Process only one $bWHITE<file>$bRED.
$bWHITE│   $bCYAN║$Reset    
$bWHITE│   $bCYAN║$Reset $bYELLOW ###$bRED 'FILE' process$bYELLOW triggers :
$bWHITE│   $bCYAN║$Reset  
$bWHITE│   $bCYAN║$Reset    ¤$bYELLOW --get   $bWHITE:$bYELLOW Indicate that the $bWHITE<file>$bYELLOW arg is the URL of the file in raw/GET.
$bWHITE│   $bCYAN║$Reset    ¤$bYELLOW --rm    $bWHITE:$bYELLOW Remove the $bWHITE<file>$bYELLOW post process. 
$bWHITE│   $bCYAN║$Reset    ¤$bYELLOW --install [format(s)]   $bWHITE:$bYELLOW Install the color-scheme into the [format(s)](Terminal(s)) selected.
$bWHITE│   $bCYAN║$Reset
$bWHITE│   $bCYAN║$Reset $bYELLOW ###$bRED 'SHOW' process$bYELLOW triggers :
$bWHITE│   $bCYAN║$Reset  
$bWHITE│   $bCYAN║$Reset    ¤$bYELLOW --get   $bWHITE:$bYELLOW Indicate that the $bWHITE<file>$bYELLOW arg is the URL of the file in raw/GET 
$bWHITE│   $bCYAN║$Reset    ¤$bYELLOW --rm    $bWHITE:$bYELLOW Romve the $bWHITE<file>$bYELLOW post process. 
$bWHITE│   $bCYAN║$Reset
$bWHITE│   $bCYAN║$Reset $bMAGN ## Formats :
$bWHITE│   $bCYAN║$Reset
$bWHITE│   $bCYAN║$Reset    $bMAGN╔════════════════╦════════════════╦════════════════╦════════════════╦════════════════╗
$bWHITE│   $bCYAN║$Reset    $bMAGN║ Format Name    ║ Format param   ║ Input Supp?    ║ Install Supp?  ║ Convert Supp?  ║
$bWHITE│   $bCYAN║$Reset    $bMAGN╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$bWHITE│   $bCYAN║$Reset    $bMAGN║ Gogh           ║$bRED NULL           $bMAGN║$bGREEN YES            $bMAGN║$bRED NO             $bMAGN║$bRED NO             $bMAGN║
$bWHITE│   $bCYAN║$Reset    $bMAGN╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$bWHITE│   $bCYAN║$Reset    $bMAGN║ Oso's Base16   ║$bRED NULL           $bMAGN║$bGREEN YES            $bMAGN║$bRED NO             $bMAGN║$bRED NO             $bMAGN║
$bWHITE│   $bCYAN║$Reset    $bMAGN╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$bWHITE│   $bCYAN║$Reset    $bMAGN║ XResources     ║$bRED NULL           $bMAGN║$bGREEN YES            $bMAGN║$bRED NO             $bMAGN║$bRED NO             $bMAGN║
$bWHITE│   $bCYAN║$Reset    $bMAGN╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
$bWHITE│   $bCYAN║$Reset    $bMAGN║ Kitty .conf    ║$bGREEN --kitty        $bMAGN║$bRED NO             $bMAGN║$bGREEN YES            $bMAGN║$bRED NO             $bMAGN║
$bWHITE│   $bCYAN║$Reset    $bMAGN╚════════════════╩════════════════╩════════════════╩════════════════╩════════════════╝
$bWHITE│   $bCYAN║$Reset
$bWHITE│   $bCYAN╚════════════════════$Reset
")
EOF

#$bWHITE│   $bCYAN║$Reset    ╔════════════════╦════════════════╦════════════════╦════════════════╦════════════════╗
#$bWHITE│   $bCYAN║$Reset    ║ Format Name    ║ Format param   ║ Input Supp?    ║ Install Supp?  ║ Convert Supp?  ║
#$bWHITE│   $bCYAN║$Reset    ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
#$bWHITE│   $bCYAN║$Reset    ║ Gogh           ║ NULL           ║ YES            ║ NO             ║ NO             ║
#$bWHITE│   $bCYAN║$Reset    ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
#$bWHITE│   $bCYAN║$Reset    ║ Oso's Base16   ║ NULL           ║ YES            ║ NO             ║ NO             ║
#$bWHITE│   $bCYAN║$Reset    ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
#$bWHITE│   $bCYAN║$Reset    ║ XResources     ║ NULL           ║ YES            ║ NO             ║ NO             ║
#$bWHITE│   $bCYAN║$Reset    ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
#$bWHITE│   $bCYAN║$Reset    ║ Kitty .conf    ║ --kitty        ║ NO             ║ YES            ║ NO             ║
#$bWHITE│   $bCYAN║$Reset    ╚════════════════╩════════════════╩════════════════╩════════════════╩════════════════╝

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

  debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN├── $bBLUE¤ Verifying if file is empty... $Reset"

  if [[ ! -s "$1" ]]; then

    
    debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN│   $bBLUE└── $bRED¤ ERROR... file :$bWHITE $1 $bRED: is empty! $Reset" "$bWHITE│   $bRED│   $bCYAN├── $bRED¤ ERROR... file :$bWHITE $1 $bRED: is empty! $Reset"   
    
    fileEmpty=true

  else 

    debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN│   $bBLUE└── $bGREEN¤ File :$bWHITE $1 $bGREEN: is not empty! $Reset"

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

  debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN├── $bBLUE¤ Verifying if file exist... $Reset"
  
  if [ -f "$1" ]; then

      debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN│   $bBLUE└── $bGREEN¤ File :$bWHITE $1 $bGREEN: Exist! $Reset"

      fileExist=true

  else

      debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN│   $bBLUE└── $bRED¤ ERROR... file :$bWHITE $1 $bRED: doesn't Exist! $Reset" "$bWHITE│   $bRED│   $bCYAN├── $bRED¤ ERROR... file :$bWHITE $1 $bRED: doesn't Exist! $Reset"   
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


  debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN├── $bBLUE¤ Verifying if can acces to file... $Reset"
  
  if [  -r "$1" ]; then

      debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN│   $bBLUE└── $bGREEN¤ File :$bWHITE $1 $bGREEN: can be accessed! $Reset"

      fileAccess=true

  else

      debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN│   $bBLUE└── $bRED¤ ERROR... can't access to file :$bWHITE $1 $bRED: ! $Reset" "$bWHITE│   $bRED│   $bCYAN├── $bRED¤ ERROR... can't access to file :$bWHITE $1 $bRED: ! $Reset"   

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

  debug_Message "$bWHITE│   $bRED│   $bCYAN├── $bMAGN¤ Verifying file... $Reset"

  # Reset Variables
  fileExist=false
  fileEmpty=false
  fileAccess=false

  #Exist?
  verify_If_File_Exist $1
  if [[ "$fileExist" == false ]]; then

    debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN└────────"   "$bWHITE│   $bRED│   $bCYAN└──── "
    debug_Message "$bWHITE│   $bRED│   $bCYAN└─────────────"        "$bWHITE│   $bRED└─────────"
    debug_Message "$bWHITE│   $bRED└──────────────────" 

    exit_Code 7
  fi

  #Access?
  verify_If_Access $1
  if [[ "$fileAccess" == false ]]; then

    debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN└────────"   "$bWHITE│   $bRED│   $bCYAN└──── "
    debug_Message "$bWHITE│   $bRED│   $bCYAN└─────────────"        "$bWHITE│   $bRED└─────────"
    debug_Message "$bWHITE│   $bRED└──────────────────" 

    exit_Code 5
  fi

  #Empty?
  verify_If_Empty $1
  if [[ "$fileEmpty" == true ]]; then

    debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN└────────"   "$bWHITE│   $bRED│   $bCYAN└──── "
    debug_Message "$bWHITE│   $bRED│   $bCYAN└─────────────"        "$bWHITE│   $bRED└─────────"
    debug_Message "$bWHITE│   $bRED└──────────────────" 

    exit_Code 5
  fi

  debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bMAGN└── $bGREEN¤ File verified!" 

  


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
    echo -e "$bWHITE│   $bYELLOW└──$bRED ¤ Error : Missing Depdencencie : $bCYAN yq $Reset"
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
      "--help")
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
      "--kitty")
        format_kitty=true
        formats_used=true
        ;;

        
    esac

  done 

  # prevent double param
  if [[ "$params_used" > 1 ]]; then
    echo -e "$bWHITE│   $bBLUE└──$bRED ¤ Error : More than one MAIN Param.$Reset" 
    exit_Code 2
  fi

  # save args
  if [[ "$param_with_args_was_used" == true ]]; then
    # save arg
    file_arg="${!arg_position}"
  fi

  # verify if args isn't a trigger
  if [[ "$file_arg" == *"--help"* || "$file_arg" == *"--debug"* || "$file_arg" == *"--get"* || "$file_arg" == *"--rm"* || "$file_arg" == *"--install"* || "$file_arg" == *"--kitty"* ]]; then
    echo -e "$bWHITE│   $bBLUE└──$bRED ¤ Error : Using a trigger like the <file> arg $Reset"
    exit_Code 9
  fi


  # verify missing args
  if [[ "$param_with_args_was_used" == true && "$file_arg" == "" ]]; then
    echo -e "$bWHITE│   $bBLUE└──$bRED ¤ Error : Missing Arguments \`$type_of_param <file>\` $Reset"
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

   debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bBLUE├── $bCYAN¤ Executing Oso's Base16 scanner... $Reset"

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

    debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bBLUE│   $bCYAN└── $bGREEN¤ Oso's Base16 format detected! $Reset"
   
    file_type_detected=true
    file_type="OsoB16"

  fi

}



#__   ________                                        
#\ \ / /| ___ \                                       
# \ V / | |_/ /___  ___  ___  _   _ _ __ ___ ___  ___ 
# /   \ |    // _ \/ __|/ _ \| | | | '__/ __/ _ \/ __|
#/ /^\ \| |\ \  __/\__ \ (_) | |_| | | | (_|  __/\__ \
#\/   \/\_| \_\___||___/\___/ \__,_|_|  \___\___||___/
function XResources_Scanner () {

  debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bBLUE├── $bCYAN¤ Executing XResources scanner... $Reset"

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

    debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bBLUE│   $bCYAN└── $bGREEN¤ XResources format detected! $Reset"

    file_type_detected=true
    file_type="XResources"

  fi

}



# _____              
#|  ___|             
#| |____  _____  ___ 
#|  __\ \/ / _ \/ __|
#| |___>  <  __/ (__ 
#\____/_/\_\___|\___|
function exec_Scanners () {

  echo -e "$bWHITE│   $bRED│   $bCYAN├── $bBLUE¤ Scanning file :$bWHITE $1 $bBLUE: ...$Reset"
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

  #





  #Format message
  if [[ "$file_type_detected" == true ]]; then

    echo -e "$bWHITE│   $bRED│   $bCYAN│   $bBLUE└── $bGREEN¤ :$bWHITE $file_type $bGREEN: Format detected!  $Reset"

  else

    echo -e "$bWHITE│   $bRED│   $bCYAN│   $bBLUE└── $bRED¤ Can't identify format in file :$bWHITE $1 $bRED...   $Reset"    

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

  echo -e "$bWHITE│   $bRED│   $bCYAN├── $bBLUE¤ Colors : $Reset"

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

  #$bWHITE│   $bYELLOW│   $bBLUE│
  #$bWHITE│   $bYELLOW│   $bBLUE│

  cat <<EOF
$(printf "$bWHITE│   $bRED│   $bCYAN│   $bBLUE│ $Reset Background : \e[48;2;${rBackground};${gBackground};${bBackground}m    $Reset | Foreground : \e[48;2;${rForeground};${gForeground};${bForeground}m    $Reset 
$bWHITE│   $bRED│   $bCYAN│   $bBLUE│
$bWHITE│   $bRED│   $bCYAN│   $bBLUE│ $Reset bBlack     : \e[48;2;${rBBlack};${gBBlack};${bBBlack}m    $Reset | lBlack     : \e[48;2;${rLBlack};${gLBlack};${bLBlack}m    $Reset
$bWHITE│   $bRED│   $bCYAN│   $bBLUE│ $Reset bRed       : \e[48;2;${rBRed};${gBRed};${bBRed}m    $Reset | lRed       : \e[48;2;${rLRed};${gLRed};${bLRed}m    $Reset
$bWHITE│   $bRED│   $bCYAN│   $bBLUE│ $Reset bGreen     : \e[48;2;${rBGreen};${gBGreen};${bBGreen}m    $Reset | lGreen     : \e[48;2;${rLGreen};${gLGreen};${bLGreen}m    $Reset
$bWHITE│   $bRED│   $bCYAN│   $bBLUE│ $Reset bYellow    : \e[48;2;${rBYellow};${gBYellow};${bBYellow}m    $Reset | lYellow    : \e[48;2;${rLYellow};${gLYellow};${bLYellow}m    $Reset
$bWHITE│   $bRED│   $bCYAN│   $bBLUE│ $Reset bBlue      : \e[48;2;${rBBlue};${gBBlue};${bBBlue}m    $Reset | lBlue      : \e[48;2;${rLBlue};${gLBlue};${bLBlue}m    $Reset
$bWHITE│   $bRED│   $bCYAN│   $bBLUE│ $Reset bMagenta   : \e[48;2;${rBMagenta};${gBMagenta};${bBMagenta}m    $Reset | lMagenta   : \e[48;2;${rLMagenta};${gLMagenta};${bLMagenta}m    $Reset
$bWHITE│   $bRED│   $bCYAN│   $bBLUE│ $Reset bCyan      : \e[48;2;${rBCyan};${gBCyan};${bBCyan}m    $Reset | lCyan      : \e[48;2;${rLCyan};${gLCyan};${bLCyan}m    $Reset
$bWHITE│   $bRED│   $bCYAN│   $bBLUE│ $Reset bWhite     : \e[48;2;${rBWhite};${gBWhite};${bBWhite}m    $Reset | lWhite     : \e[48;2;${rLWhite};${gLWhite};${bLWhite}m    $Reset
$bWHITE│   $bRED│   $bCYAN│   $bBLUE└────────────────────────────────────────
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


# _____              
#|  ___|             
#| |____  _____  ___ 
#|  __\ \/ / _ \/ __|
#| |___>  <  __/ (__ 
#\____/_/\_\___|\___|
function exec_Reader () {

  echo -e "$bWHITE│   $bRED│   $bCYAN├── $bBLUE¤ Reading file :$bWHITE $1 $bBLUE: ...$Reset"

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


  # setear el output al de kitty
  output_file="$HOME/.config/kitty/theme.conf"
  test=$(basename $output_file)

  debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bBLUE│   $bYELLOW└──$bMAGN ¤ Installing kitty theme : $test : ... $Reset"

  # mandar a escribir el archivo en esa locacion
  writter_Kitty "$output_file"

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

    echo -e "$bWHITE├── $bGREEN¤ Getting file...$Reset"

    status_code=$(curl -s -o /dev/null -w "%{http_code}" "$1")
    if [[ "$status_code" == 200 ]]; then

      bsname=$(basename "$1")

      curl -sSL -o "$bsname" "$1"

      file_arg="$bsname"

      canDownload=true

    else 

      echo -e "$bWHITE│   $bGREEN└─ $bRED¤ ERROR : can't access to the file...$Reset"

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

  echo -e "$bWHITE│   $bRED│   $bCYAN├── $bBLUE¤ Executing triggers...$Reset"

  if [[ $triggers_used == false ]]; then
    echo -e "$bWHITE│   $bRED│   $bCYAN│   $bBLUE└──$bRED ¤ No triggers detected...$Reset"
    
  else 

    # installers
    if [[ "$trigg_install" == true ]]; then

      echo -e "$bWHITE│   $bRED│   $bCYAN│   $bBLUE├──$bYELLOW ¤ Trigger : Installing... $Reset"

      if [[ "$formats_used" == true ]]; then

        # Kitty
        if [[ "$format_kitty" == true ]]; then
          installer_Kitty
        fi

      else
        debug_Message "$bWHITE│   $bRED│   $bCYAN│   $bBLUE│   $bYELLOW└──$bRED ¤ No formats to install... $Reset"
      fi

    fi

    #Converters

    echo -e "$bWHITE│   $bRED│   $bCYAN│   $bBLUE└── ¤ All triggers executed! $Reset"

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

  echo -e "$bWHITE├── $bRED¤ Executing \"FILE\" process...$Reset"
  echo -e "$bWHITE│   $bRED├── $bCYAN¤ Proccessing file :$bWHITE $file_arg $bCYAN: ...$Reset"

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
    echo -e "$bWHITE│   $bRED│   $bCYAN│   $bBLUE└── $bRED¤ ERROR : Missing or null values...$Reset"
    echo -e "$bWHITE│   $bRED│   $bCYAN└────────"
    echo -e "$bWHITE│   $bRED└─────────────"
    exit_Code 4
  fi

  # Show colors
  print_Colors

  # Exec triggers...
  exec_Triggers
  echo -e "$bWHITE│   $bRED│   $bCYAN└─────────$Reset"
  echo -e "$bWHITE│   $bRED└──────────────$Reset"
  #remove the file?
  remove_file

}

function exec_THIS () {

  echo -e "$bWHITE├── $bRED¤ Executing \"THIS\" process...$Reset"

}

function exec_BADDIES () {

  echo -e "$bWHITE├── $bRED¤ Executing \"BADDIES\" process...$Reset"

}

function exec_SHOW () {

  #get the file
  get_File $file_arg
  if [[ "$canDownload"  == false && "$trigg_get" == true ]]; then
    exit_Code 10
  fi

  echo -e "$bWHITE├── $bRED¤ Executing \"SHOW\" process...$Reset"
  echo -e "$bWHITE│   $bRED├── $bCYAN¤ Proccessing file :$bWHITE $file_arg $bCYAN: ...$Reset"

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
    echo -e "$bWHITE│   $bRED│   $bCYAN└────────" 
    echo -e "$bWHITE│   $bRED└─────────────" 
    exit_Code 6
  fi

  # verificar data
  if [[ "$dataVerified" == false ]]; then 
    echo -e "$bWHITE│   $bRED│   $bCYAN│   $bBLUE└── $bRED¤ ERROR : Missing or null values...$Reset"
    echo -e "$bWHITE│   $bRED│   $bCYAN└────────"
    echo -e "$bWHITE│   $bRED└─────────────"
    exit_Code 4
  fi

  # Show colors
  print_Colors
  echo -e "$bWHITE│   $bRED│   $bCYAN└─────────────────────────────────────────────"
  echo -e "$bWHITE│   $bRED└──────────────────────────────────────────────────"


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
$bRED _______       __                   _______                                        
|   _   .-----|  .-----.----.______|   _   .----.-----.----.-----.-----.-----.----.
|.  1___|  _  |  |  _  |   _|______|.  1   |   _|  _  |  __|  -__|__ --|  _  |   _|
|.  |___|_____|__|_____|__|        |.  ____|__| |_____|____|_____|_____|_____|__|  
|:  1   |                          |:  |                                           
|::.. . |                          |::.|                                           
\`-------'                          \`---'  $Reset 
") 
EOF
echo -e "$bWHITE¤ Welcome!$Reset"

echo -e "$bWHITE├── $bBLUE¤ Verifiying params...$Reset"
verify_Params $@ 

help_Message 

echo -e "$bWHITE├── $bBLUE¤ Verifiying dependencies...$Reset"
verify_Dependencies

exec_Engine

exit_Code 0