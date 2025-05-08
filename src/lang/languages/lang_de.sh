#!/usr/bin/env bash

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} Beende mit Code: ${COLOR_W}"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} Keine Fehler aufgetreten!"
    [EXIT_1]="${PREFIX_ERROR} Mehr als ein Prozessparameter wurde eingegeben"
    [EXIT_2]="${PREFIX_ERROR} Ein Parameter wurde als Argument eingegeben"
    [EXIT_3]="${PREFIX_ERROR} Das eingegebene Argument ist leer"
    [EXIT_4]="${PREFIX_ERROR} Fehlende Abhängigkeit: ${COLOR_W} yq"
    [EXIT_5]="${PREFIX_ERROR} Fehlende Abhängigkeit: ${COLOR_W} taplo"
    [EXIT_6]="${PREFIX_ERROR} Die Datei konnte nicht heruntergeladen werden"
    [EXIT_7]="${PREFIX_ERROR} Die Datei EXISTIERT NICHT!"
    [EXIT_8]="${PREFIX_ERROR} Du hast keine Leseberechtigung für die Datei!"
    [EXIT_9]="${PREFIX_ERROR} Die Datei ist leer!"
    [EXIT_10]="${PREFIX_ERROR} Das Dateiformat konnte nicht erkannt werden!"
    [EXIT_11]="${PREFIX_ERROR} Es existiert kein Leser für das erkannte Format!"
    [EXIT_12]="${PREFIX_ERROR} Die Datei enthält fehlende Werte!"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} Überprüfe die Parameter..."

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} Überprüfe Abhängigkeiten..."

    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} Überprüfe das Argument: ${COLOR_W}"
    [arguments_verified]="${PREFIX_SUCCESS} Argumente überprüft!"

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} Lade die Datei herunter: ${COLOR_W}"
    [file_getted]="${PREFIX_SUCCESS} Die Datei wurde erfolgreich heruntergeladen!"

    # --help 
    [manual_title]="${PREFIX_INFO} Handbuch:"
    [manual_content]="
Color-Processor: Ein Werkzeug zur Verwaltung von Farbthemen!

# Abhängigkeiten:

  ¤ Bash
  ¤ yq
  ¤ taplo

# Verwendung:

  Color-Converter.sh [Hilfe(n)] [Prozess] | [Prozess] [Hilfe(n)] 

## Hilfen:

  ¤ [ -h | --help ]          : Zeigt dieses Handbuch an.
  ¤ [ -d | --debug ]         : Zeigt Debug-Nachrichten an.
    
## Prozesse:

  ¤ SHOW <Datei> [Aktion(en)] : Zeigt nur die Informationen der <Datei>.
  ¤ FILE <Datei> [Aktion(en)] : Verarbeitet die <Datei>.
    
### Aktionen des Prozesses 'FILE':
  
  ¤ --get                     : Gibt an, dass die eingegebene <Datei> eine URL ist 
                                und aus dem Internet heruntergeladen werden muss.
  ¤ --rm                      : Löscht die <Datei> nach der Verarbeitung.
  ¤ --install [Format(e)]     : Installiert das Farbschema in den ausgewählten [Format(en)].
  ¤ --convert [Format(e)]     : Konvertiert das Farbschema in die ausgewählten [Format(en)].

### Aktionen des Prozesses 'SHOW':
  
  ¤ --get                     : Gibt an, dass die eingegebene <Datei> eine URL ist 
                                und aus dem Internet heruntergeladen werden muss.
  ¤ --rm                      : Löscht die <Datei> nach der Verarbeitung.

## Formate:

  ¤ --all                    : Verwendet alle verfügbaren Formate

  ╔════════════════╦════════════════╦════════════════╦════════════════╦════════════════╗
  ║ Format Name    ║ Format Param   ║ Input Support? ║ Install Supp?  ║ Convert Supp?  ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Gogh           ║ NULL           ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Oso's Base16   ║ --oso          ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Base16         ║ NULL           ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ XResources     ║ --xresources   ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Kitty .conf    ║ --kitty        ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Alacritty.toml ║ --alacritty    ║ YES            ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Termite        ║ --termite      ║ NO             ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Termux         ║ --termux       ║ NO             ║ NO             ║ NO             ║
  ╠════════════════╬════════════════╬════════════════╬════════════════╬════════════════╣
  ║ Linux TTY      ║ --linuxtty     ║ NO             ║ NO             ║ NO             ║
  ╚════════════════╩════════════════╩════════════════╩════════════════╩════════════════╝
  "

  # Data helpers

    # file verifier :
    [verifying_file]="${PREFIX_VERIFICATOR} Überprüfe die Datei: ${COLOR_W}"

      # Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} Überprüfe, ob die Datei existiert..."
      [file_exist]="${PREFIX_SUCCESS} Die Datei existiert!"

      # Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} Überprüfe, ob du Leseberechtigungen für die Datei hast..."
      [file_access]="${PREFIX_SUCCESS} Du hast Leseberechtigungen!"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} Überprüfe, ob die Datei leer ist..."
      [file_not_empty]="${PREFIX_SUCCESS} Die Datei ist nicht leer!"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} Überprüfe die Daten..."
  
    # Color printer :
    [colors_title]="${PREFIX_INFO} Farben:"

  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} Prozess wird ausgeführt: ${COLOR_W}"
    [processing_file]="${PREFIX_FILE} Verarbeite die Datei: ${COLOR_W}"

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} Scanner werden ausgeführt..."
    [executing_scanner]="${PREFIX_STEP} Scanner wird ausgeführt: ${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} Format erkannt!: ${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} Scanner erfolgreich ausgeführt!"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} Überprüfe den Leser: ${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} Leser wird ausgeführt: ${COLOR_W}"

  # file actions

    [executing_file_actions]="${PREFIX_ACTION} Führe Dateiprozesse aus: ${COLOR_W}"

    # --outdir flag
    [path_set_to]="${PREFIX_STEP} Ausgabepfad gesetzt auf: ${COLOR_W}"
    [unexisting_path]="${PREFIX_ERROR} Eingebener Pfad existiert nicht: ${COLOR_W}"

    # --mkdir flag
    [creating_dir]="${PREFIX_STEP} Erstelle das Verzeichnis: ${COLOR_W}"

      # converters :
      [executing_converters]="${PREFIX_ACTION} Converter werden ausgeführt... ${COLOR_W}"
      [executing_conversor]="${PREFIX_STEP} Converter wird ausgeführt: ${COLOR_W}"
      [no_converters_to_execute]="${PREFIX_ERROR} Es gibt keine Formate zu konvertieren! ${COLOR_W}"
      [file_converted]="${PREFIX_SUCCESS} Datei konvertiert!: ${COLOR_W}"
      [all_files_converted]="${PREFIX_SUCCESS} Alle Dateien wurden konvertiert! ${COLOR_W}"

    [all_file_actions_executed]="${PREFIX_SUCCESS} Alle Prozesse wurden erfolgreich ausgeführt! ${COLOR_W}"
)
