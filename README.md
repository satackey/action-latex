# action-latexmk

このアクションは指定されたファイルを`latexmk`コマンドでコンパイルします。
DooD(Docker outside of Docker)を使っているため、任意Dockerイメージが利用可能です。

## Inputs

### `docker-image`

_**必須**_ `latexmk`コマンドを実行するためのレジストリで公開されている Docker イメージ

### `build-files`

_**必須**_ 1行ごとに区切られたビルドするファイルリスト
(`host-workspace`からの相対パス)  

### `host-workspace`

_任意_ ビルドするファイルのディレクトリ
(ホストVMの絶対パス)  
このパスがDockerコンテナにマウントされます。
デフォルトは`actions/checkout`でチェックアウトされるパスです。

### `container-workdir`

_任意_ コンテナ内のワークディレクトリ  
`host-workspace`で指定されたディレクトリが、Dockerコンテナ内のこのパスへマウントされます。

### `latexmk-options`
_任意_ `latexmk`コマンド実行時のオプション

## 使用例

```yaml
- name: Build LaTeX files
  uses: satackey/action-latexmk@v1
  with:
    docker-image: paperist/alpine-texlive-ja
    build-files: |
      hoge/main.tex
      fuga/main.tex
      piyo/main.tex
```
