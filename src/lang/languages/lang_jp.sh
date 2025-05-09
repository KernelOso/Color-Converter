#!/usr/bin/env bash

declare -A messages=(

  # Exiting...
  [exiting_whit_code]="${PREFIX_EXIT} 終了コード: ${COLOR_W} で終了します"

  # Exit code messages
    [EXIT_0]="${PREFIX_SUCCESS} エラーは発生しませんでした！"
    [EXIT_1]="${PREFIX_ERROR} 複数のプロセスパラメータが渡されました"
    [EXIT_2]="${PREFIX_ERROR} パラメータが引数として指定されました"
    [EXIT_3]="${PREFIX_ERROR} 引数が空です"
    [EXIT_4]="${PREFIX_ERROR} 必要な依存関係が見つかりません: ${COLOR_W} yq"
    [EXIT_5]="${PREFIX_ERROR} 必要な依存関係が見つかりません: ${COLOR_W} taplo"
    [EXIT_6]="${PREFIX_ERROR} ファイルのダウンロードに失敗しました"
    [EXIT_7]="${PREFIX_ERROR} ファイルが存在しません！"
    [EXIT_8]="${PREFIX_ERROR} ファイルの読み取り権限がありません！"
    [EXIT_9]="${PREFIX_ERROR} ファイルが空です！"
    [EXIT_10]="${PREFIX_ERROR} ファイルの形式を判別できませんでした！"
    [EXIT_11]="${PREFIX_ERROR} 判別された形式に対応するリーダーがありません！"
    [EXIT_12]="${PREFIX_ERROR} ファイルに欠損している値があります！"

  # Script Treatment

    # Parameters Treatment
    [reading_parameters]="${PREFIX_VERIFICATOR} パラメータを確認中..."

    # Dependencies Treatment
    [Verifying_dependencies]="${PREFIX_VERIFICATOR} 依存関係をチェックしています..."

    # Argument Treatment
    [verifying_args]="${PREFIX_STEP} 引数を確認中: ${COLOR_W}"
    [arguments_verified]="${PREFIX_SUCCESS} 引数の確認が完了しました！"

  # Flags

    # --get :
    [getting_file]="${PREFIX_ACTION} ファイルを取得中: ${COLOR_W}"
    [file_getted]="${PREFIX_SUCCESS} ファイルのダウンロードが完了しました！"

    # --help 
    [manual_title]="${PREFIX_INFO} マニュアル:"
    [manual_content]="
Color-Processor：カラーテーマを管理するためのツールです！

# 必要な依存関係:

  ¤ Bash
  ¤ yq
  ¤ taplo

# 使い方:

  Color-Converter.sh [ヘルプ] [プロセス] | [プロセス] [ヘルプ]

## ヘルプオプション:

  ¤ [ -h | --help ]          : このマニュアルを表示します。
  ¤ [ -d | --debug ]         : デバッグメッセージを表示します。
    
## プロセス:

  ¤ SHOW <ファイル> [アクション] : <ファイル> の情報を表示するのみ。
  ¤ FILE <ファイル> [アクション] : <ファイル> を処理します。
    
### 'FILE'プロセスのアクション:
  
  ¤ --get                     : 指定された <ファイル> がURLの場合、ダウンロードします。
  ¤ --rm                      : 処理後に <ファイル> を削除します。
  ¤ --install [形式]         : カラーパレットを指定した形式にインストールします。
  ¤ --convert [形式]         : カラーパレットを指定形式に変換します。

### 'SHOW'プロセスのアクション:
  
  ¤ --get                     : 指定された <ファイル> がURLの場合、ダウンロードします。
  ¤ --rm                      : 処理後に <ファイル> を削除します。

## 対応形式:

  ¤ --all                    : 利用可能なすべての形式を使用します

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
    [verifying_file]="${PREFIX_VERIFICATOR} ファイルを確認中: ${COLOR_W}"

      # Exist?
      [verifying_if_file_exit]="${PREFIX_STEP} ファイルが存在するか確認中..."
      [file_exist]="${PREFIX_SUCCESS} ファイルは存在します！"

      # Can be accessed?
      [verifying_if_file_can_access]="${PREFIX_STEP} ファイルの読み取り権限を確認中..."
      [file_access]="${PREFIX_SUCCESS} 読み取り可能です！"

      # Empty?
      [verifying_if_file_empty]="${PREFIX_STEP} ファイルが空かどうか確認中..."
      [file_not_empty]="${PREFIX_SUCCESS} ファイルは空ではありません！"
    
    # data verifier :
    [verifying_data]="${PREFIX_VERIFICATOR} データを確認中..."

    # Color printer :
    [colors_title]="${PREFIX_INFO} カラー一覧:"

  # Actions

    # processes :
    [executing_process]="${PREFIX_PROCESS} プロセスを実行中: ${COLOR_W}"
    [processing_file]="${PREFIX_FILE} ファイルを処理中: ${COLOR_W}"

      # baddies
      [skipping_file]="${PREFIX_FILE} ファイルをスキップしています... ${COLOR_W}"

    # scanners :
    [executing_scanners]="${PREFIX_ACTION} スキャナを起動中..."
    [executing_scanner]="${PREFIX_STEP} スキャナ実行中: ${COLOR_W}"
    [format_detected]="${PREFIX_SUCCESS} 形式を検出しました: ${COLOR_W}"
    [scanners_executed]="${PREFIX_SUCCESS} スキャナの実行が完了しました！"

    # readers :
    [verifying_reader]="${PREFIX_VERIFICATOR} リーダーを確認中: ${COLOR_W}"
    [executing_reader]="${PREFIX_ACTION} リーダーを実行中: ${COLOR_W}"

  # file actions

    [executing_file_actions]="${PREFIX_ACTION} ファイル処理を実行中: ${COLOR_W}"

    # --outdir flag
    [path_set_to]="${PREFIX_STEP} 出力先が次に設定されました: ${COLOR_W}"
    [unexisting_path]="${PREFIX_ERROR} 指定されたパスが存在しません: ${COLOR_W}"

    # --mkdir flag
    [creating_dir]="${PREFIX_STEP} ディレクトリを作成中: ${COLOR_W}"

      # converters :
      [executing_converters]="${PREFIX_ACTION} コンバーターを実行中... ${COLOR_W}"
      [executing_conversor]="${PREFIX_STEP} コンバーター実行中: ${COLOR_W}"
      [no_converters_to_execute]="${PREFIX_ERROR} 変換可能な形式がありません！ ${COLOR_W}"
      [file_converted]="${PREFIX_SUCCESS} ファイルを変換しました: ${COLOR_W}"
      [all_files_converted]="${PREFIX_SUCCESS} すべてのファイルを変換しました！ ${COLOR_W}"

    [all_file_actions_executed]="${PREFIX_SUCCESS} すべての処理が完了しました！ ${COLOR_W}"
)
