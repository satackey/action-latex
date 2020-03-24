# action-latex

<!-- このアクションは指定されたファイル・コマンドでコンパイルを行います。

このアクションの実行で起動されたコンテナ内で、
DooD(Docker outside of Docker)を使うことで、
任意Dockerイメージを起動しています。 -->

This action builds LaTeX files on any Docker image.

## Example

```yaml
- name: Build LaTeX files
  uses: satackey/action-latex@v2
  with:
    docker-image: paperist/alpine-texlive-ja
    build-entrypoint: latexmk
    build-files: |
      foo/main.tex
      bar/main.tex
      baz/main.tex
```

## Inputs

### `docker-image`


<!-- コンパイルコマンドを実行する Docker イメージ -->
- _**Required**_  

    Docker image published on Dockerhub that runs build.  

### `build-files`

<!-- 1行ごとに区切られた、ビルドするTeXファイルの相対パスのリスト -->
- _**Required**_  

    A Line-separated list of paths of the TeX files to build.  
    These paths must be relative to `working-directory`.  

<!-- ### `host-workspace`

- _Optional_ 　
    ビルドするファイルがあるホストVMディレクトリの絶対パス
    Absolute path of the host VM directory where the file to be built is located.

    If not specified, 

指定されなかった場合、アクションより起動された Docker コンテナの `/github/workspace` ディレクトリがコンパイル用の Docker コンテナへマウントされます。  
指定された場合、そのパスがコンパイル用の Docker コンテナの `/custom/workspace` ディレクトリにマウントされます。 -->

### `build-entrypoint`

- _optional_  

    The entrypoint of Docker container that runs build.  
    If not specified, the Docker container starts using default entrypoint.

<!-- _任意_ コンパイル時に起動する Docker コンテナの Entrypoint  
指定されなければ Docker イメージの Entrypoint で起動されます。
`latexmk` などを指定してください。 -->

### `build-args`

- _optional_  

    Extra arguments to run the build.  


<!-- _任意_ コンパイル実行時の追加オプション -->

## Contribution
PRs are accepted.

If you are having trouble or future request, [post new issue](https://github.com/satackey/action-latex/issues/new).
