# action-latexmk

このアクションは指定されたファイルを`latexmk`コマンドでコンパイルします。
DooD(Docker outside of Docker)を使っているため、任意Dockerイメージが利用可能です。

## Inputs

### `docker-image`

**必須** `latexmk`コマンドを実行するためのレジストリで公開されている Docker イメージ

### `build-files`

**必須** 1行ごとに区切られたビルドするファイルリスト
(`host-workspace`からの相対パス)  
デフォルトは`actions/checkout`でチェックアウトされるパスです。

### `host-workspace`

**任意** ビルドするファイルのディレクトリ
(ホストVMの絶対パス)  
このパスがDockerコンテナにマウントされます。

### `container-workdir`

**任意** コンテナ内のワークディレクトリ
このパスへDockerコンテナにマウントされます。

### `latexmk-options`
**任意** `latexmk`コマンド実行時のオプション

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
