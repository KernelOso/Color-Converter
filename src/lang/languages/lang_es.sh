#!/usr/bin/env bash

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} Saliendo con codigo : ${COLOR_W}"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} No ocurrieron errores! "
    [EXIT_1]="${PREFIX_ERROR} Se ingreso mas de un parametro de proceso "
    [EXIT_2]="${PREFIX_ERROR} Se ingreso un parametro a modo de argumento "
    [EXIT_3]="${PREFIX_ERROR} El argumento ingresado esta vacio "
    [EXIT_4]="${PREFIX_ERROR} Dependencia faltante : ${COLOR_W} yq"
    [EXIT_5]="${PREFIX_ERROR} Dependencia faltante : ${COLOR_W} taplo"
    [EXIT_6]="${PREFIX_ERROR} No se pudo descargar el archivo"
    [EXIT_7]="${PREFIX_ERROR} El archivo NO existe!"
    [EXIT_8]="${PREFIX_ERROR} No tienes permisos de lectura sobre el archivo!"
    [EXIT_9]="${PREFIX_ERROR} El archivo esta vacio!"
    [EXIT_10]="${PREFIX_ERROR} No se detecto el formato de archivo!"
    [EXIT_11]="${PREFIX_ERROR} No existe un lector para el formato detectado!"
    [EXIT_12]="${PREFIX_ERROR} El archivo tiene valores faltantes!"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} Verificando los parametros... "

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} Verificando dependencias... "
  
    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} Verificando el argumento :"
    [arguments_verified]="${PREFIX_SUCCESS} Argumentos verificados! "

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} Obteniendo el arcivo :"
    [file_getted]="${PREFIX_SUCCESS} El archivo se descargo correctamente! "

    # --help 
    [manual_title]="${PREFIX_INFO} Manual :"
    [manual_content]="
Color-Procesor : Una herramienta de manejo de temas de colores!

#Dependencias :

  ¤ Bash
  ¤ yq
  ¤ taplo

# Usabilidad : 
    
  Color-Converter.sh [ayuda(s)] [proceso] | [proceso] [ayuda(s)] 

## Ayudas :
    
  ¤ [ -h | --help ]          :   Muestra ESTE manual.
  ¤ [ -d | --debug ]         :   Muestra los mensajes de depuracion.
    
## Procesos :
    
  ¤ SHOW <archivo> [accion(es)] : Solo MUESTRA la informacion en el <archivo>.
  ¤ FILE <archivo> [accion(es)] : Procesa el <archivo>.
    
### Acciones del proceso 'FILE' :
  
  ¤ --get                     : Indica que el <archivo> ingresado es una URL, 
                                y debe ser obtenido desde internet.
  ¤ --rm                      : Elimina el <archivo> despues de procesarlo.
  ¤ --install [formato(s)]    : Installa la paleta de colores en los [formato(s)]
                                Seleccionados.
  ¤ --convert [formato(s)]    : Convierte la paleta de colores a los [formato(s)]
                                Seleccionados.

### Acciones del proceso 'SHOW' :
  
  ¤ --get                     : Indica que el <archivo> ingresado es una URL, 
                                y debe ser obtenido desde internet.
  ¤ --rm                      : Elimina el <archivo> despues de procesarlo. 

## Formatos :

  ¤ --all                    : Usa TODOS los formatos disponibles

  ╔════════════════╦════════════════╦════════════════╦════════════════╦════════════════╗
  ║ Nombre Formato ║ param Formato  ║ Soprt Entrada? ║ Soprt Instala? ║ Soprt Convers? ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Gogh           ║ NULL           ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Oso's Base16   ║ --oso          ║ YES            ║ NO             ║ YES            ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Base16         ║ NULL           ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ XResources     ║ --xresources   ║ YES            ║ NO             ║ YES            ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Kitty .conf    ║ --kitty        ║ YES            ║ YES            ║ YES            ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Alacritty.toml ║ --alacritty    ║ YES            ║ NO             ║ YES            ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Termite        ║ --termite      ║ NO             ║ NO             ║ YES            ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Termux         ║ --termux       ║ NO             ║ NO             ║ YES            ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Linux TTY      ║ --linuxtty     ║ NO             ║ NO             ║ YES            ║
  ╚════════════════╩════════════════╩════════════════╩════════════════╩════════════════╝
  "

  # Data helpers

    # file verifier :
    [verifying_file]="${PREFIX_VERIFICATOR} Verificando el arcivo :${COLOR_W}"

      #Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} Verificando si el archivo existe..."
      [file_exist]="${PREFIX_SUCCESS} El archivo existe!"

      #Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} Verificando si tienes permisos de lectura sobre el archivo..."
      [file_access]="${PREFIX_SUCCESS} Tienes permisos de lecutra!"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} Verificando si el archivo esta vacio..."
      [file_not_empty]="${PREFIX_SUCCESS} El archivo no esta vacio!"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} Verificando los datos..."
  
    # Color printer :
    [colors_title]="${PREFIX_INFO} Colores :"


  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} Ejecutando el proceso :${COLOR_W}"
    [processing_file]="${PREFIX_FILE} Procesando el archivo :${COLOR_W}"
  

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} Ejecutando escaneres..."
    [executing_scanner]="${PREFIX_STEP} Ejecutando escaner :${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} Formato detectado! :${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} Escaneres ejecutados correctamente!"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} Verificando el lector :${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} Ejecutando el lector :${COLOR_W}"

)