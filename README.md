# action-latex

このアクションは指定されたファイル・コマンドでコンパイルを行います。

このアクションの実行で起動されたコンテナ内で、
DooD(Docker outside of Docker)を使うことで、
任意Dockerイメージを起動しています。

## Inputs

### `docker-image`

_**必須**_ コンパイルコマンドを実行する Docker イメージ

### `build-files`

_**必須**_ 1行ごとに区切られた、ビルドするTeXファイルの相対パスのリスト

### `host-workspace`

_任意_ ビルドするファイルがあるホストVMディレクトリの絶対パス

指定されなかった場合、アクションより起動された Docker コンテナの `/github/workspace` ディレクトリがコンパイル用の Docker コンテナへマウントされます。  
指定された場合、そのパスがコンパイル用の Docker コンテナの `/custom/workspace` ディレクトリにマウントされます。

### `build-entrypoint`

_任意_ コンパイル時に起動する Docker コンテナの Entrypoint  
指定されなければ Docker イメージの Entrypoint で起動されます。
`latexmk` などを指定してください。

### `build-args`

_任意_ コンパイル実行時の追加オプション

## 使用例

```yaml
- name: Build LaTeX files
  uses: satackey/action-latex@v2
  with:
    docker-image: paperist/alpine-texlive-ja
    build-entrypoint: latexmk
    build-files: |
      hoge/main.tex
      fuga/main.tex
      piyo/main.tex
```
