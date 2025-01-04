# Flutterの開発ツールにパスを通す
export PATH="$PATH:$HOME/flutter/bin"
# Dart/Flutterのパッケージマネージャーにパスを通す
export PATH="$PATH:$HOME/.pub-cache/bin"
# Android SDKのツール群にパスを通す
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# Android Studio付属のJavaランタイムを設定
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# Node Version Manager (NVM)の設定
export NVM_DIR="$HOME/.nvm"
# NVMスクリプトの読み込み
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# NVMのコマンド補完機能を有効化
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ディレクトリごとの履歴ファイルを保存するディレクトリを設定
HISTDIR="${HOME}/.zsh_history.d"
# 履歴保存用ディレクトリが存在しない場合は作成
[[ ! -d "${HISTDIR}" ]] && mkdir -p "${HISTDIR}"

# ディレクトリ変更時に履歴ファイルを切り替える関数
function chpwd() {
    # カレントディレクトリのパスを@で区切った形式で履歴ファイル名として使用
    local history_file="${HISTDIR}/${PWD//\//@}"
    # 履歴ファイルが存在しない場合は新規作成
    [[ ! -f "$history_file" ]] && touch "$history_file"
    # 現在の履歴ファイルを切り替え
    HISTFILE="$history_file"
}

# メモリ上に保持する履歴の数を設定
HISTSIZE=1000
# ファイルに保存する履歴の数を設定
SAVEHIST=1000

# 履歴をセッション間で共有
setopt share_history
# 重複するコマンドを履歴に追加しない
setopt hist_ignore_dups
# スペースで始まるコマンドを履歴に追加しない（秘密のコマンドとして扱う）
setopt hist_ignore_space

# 初回起動時の履歴設定を実行
chpwd