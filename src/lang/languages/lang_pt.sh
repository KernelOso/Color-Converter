#!/usr/bin/env bash

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} Saindo com código: ${COLOR_W}"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} Não ocorreram erros!"
    [EXIT_1]="${PREFIX_ERROR} Foi inserido mais de um parâmetro de processo"
    [EXIT_2]="${PREFIX_ERROR} Foi inserido um parâmetro como argumento"
    [EXIT_3]="${PREFIX_ERROR} O argumento inserido está vazio"
    [EXIT_4]="${PREFIX_ERROR} Dependência ausente: ${COLOR_W} yq"
    [EXIT_5]="${PREFIX_ERROR} Dependência ausente: ${COLOR_W} taplo"
    [EXIT_6]="${PREFIX_ERROR} Não foi possível baixar o arquivo"
    [EXIT_7]="${PREFIX_ERROR} O arquivo NÃO existe!"
    [EXIT_8]="${PREFIX_ERROR} Você não tem permissão de leitura sobre o arquivo!"
    [EXIT_9]="${PREFIX_ERROR} O arquivo está vazio!"
    [EXIT_10]="${PREFIX_ERROR} Não foi detectado o formato do arquivo!"
    [EXIT_11]="${PREFIX_ERROR} Não existe um leitor para o formato detectado!"
    [EXIT_12]="${PREFIX_ERROR} O arquivo possui valores ausentes!"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} Verificando os parâmetros..."

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} Verificando dependências..."

    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} Verificando o argumento: ${COLOR_W}"
    [arguments_verified]="${PREFIX_SUCCESS} Argumentos verificados!"

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} Baixando o arquivo: ${COLOR_W}"
    [file_getted]="${PREFIX_SUCCESS} O arquivo foi baixado com sucesso!"

    # --help 
    [manual_title]="${PREFIX_INFO} Manual:"
    [manual_content]="
Color-Processor: Uma ferramenta para gerenciar temas de cores!

# Dependências:

  ¤ Bash
  ¤ yq
  ¤ taplo

# Uso:

  Color-Converter.sh [ajuda(s)] [processo] | [processo] [ajuda(s)] 

## Ajuda:

  ¤ [ -h | --help ]          : Exibe ESTE manual.
  ¤ [ -d | --debug ]         : Exibe as mensagens de depuração.
    
## Processos:

  ¤ SHOW <arquivo> [ação(ões)] : Apenas EXIBE as informações do <arquivo>.
  ¤ FILE <arquivo> [ação(ões)] : Processa o <arquivo>.
    
### Ações do processo 'FILE':
  
  ¤ --get                     : Indica que o <arquivo> inserido é uma URL 
                                e deve ser baixado da internet.
  ¤ --rm                      : Remove o <arquivo> após o processamento.
  ¤ --install [formato(s)]    : Instala a paleta de cores nos [formato(s)]
                                selecionados.
  ¤ --convert [formato(s)]    : Converte a paleta de cores para os [formato(s)]
                                selecionados.

### Ações do processo 'SHOW':
  
  ¤ --get                     : Indica que o <arquivo> inserido é uma URL 
                                e deve ser baixado da internet.
  ¤ --rm                      : Remove o <arquivo> após o processamento.

## Formatos:

  ¤ --all                    : Usa TODOS os formatos disponíveis

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
    [verifying_file]="${PREFIX_VERIFICATOR} Verificando o arquivo: ${COLOR_W}"

      # Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} Verificando se o arquivo existe..."
      [file_exist]="${PREFIX_SUCCESS} O arquivo existe!"

      # Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} Verificando se você tem permissão de leitura sobre o arquivo..."
      [file_access]="${PREFIX_SUCCESS} Você tem permissão de leitura!"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} Verificando se o arquivo está vazio..."
      [file_not_empty]="${PREFIX_SUCCESS} O arquivo não está vazio!"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} Verificando os dados..."
  
    # Color printer :
    [colors_title]="${PREFIX_INFO} Cores:"

  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} Executando o processo: ${COLOR_W}"
    [processing_file]="${PREFIX_FILE} Processando o arquivo: ${COLOR_W}"

      # baddies
      [skipping_file]="${PREFIX_FILE} Pulando o arquivo... ${COLOR_W}"

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} Executando scanners..."
    [executing_scanner]="${PREFIX_STEP} Executando scanner: ${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} Formato detectado!: ${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} Scanners executados com sucesso!"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} Verificando o leitor: ${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} Executando o leitor: ${COLOR_W}"

  # file actions

    [executing_file_actions]="${PREFIX_ACTION} Executando processos sobre arquivos: ${COLOR_W}"

    # --outdir flag
    [path_set_to]="${PREFIX_STEP} Caminho de saída definido como: ${COLOR_W}"
    [unexisting_path]="${PREFIX_ERROR} Caminho inserido inexistente: ${COLOR_W}"

    # --mkdir flag
    [creating_dir]="${PREFIX_STEP} Criando o diretório: ${COLOR_W}"

      # converters :
      [executing_converters]="${PREFIX_ACTION} Executando conversores... ${COLOR_W}"
      [executing_conversor]="${PREFIX_STEP} Executando conversor: ${COLOR_W}"
      [no_converters_to_execute]="${PREFIX_ERROR} Não há formatos para converter! ${COLOR_W}"
      [file_converted]="${PREFIX_SUCCESS} Arquivo convertido!: ${COLOR_W}"
      [all_files_converted]="${PREFIX_SUCCESS} Todos os arquivos foram convertidos! ${COLOR_W}"

    [all_file_actions_executed]="${PREFIX_SUCCESS} Todos os processos foram executados com sucesso! ${COLOR_W}"
)
