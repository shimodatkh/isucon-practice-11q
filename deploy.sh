#!/bin/bash

# set -exu -o pipefailは、シェルスクリプトの実行時にオプションを設定するためのコマンドです。具体的には、以下のオプションを設定しています。
# -e : エラーが発生した場合に、シェルスクリプトの実行を即座に終了します。
# -x : シェルスクリプトの実行時に、実行されたコマンドを表示します。
# -u : 未定義の変数を参照した場合に、エラーを発生させます。
# -o pipefail : パイプラインの途中でエラーが発生した場合に、シェルスクリプトの実行を終了します。
set -exu -o pipefail

# そのシェルスクリプトが存在するディレクトリに移動する
cd $(dirname $0)

git pull
cd go
go build -o isucondition main.go
sudo systemctl restart isucondition.go.service