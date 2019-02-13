# 一時ファイル、一時ディレクトリを使う

`mktemp`コマンドがある環境前提。

```sh
mktemp --help # 抜粋
Usage: mktemp [OPTION]... [TEMPLATE]
Create a temporary file or directory, safely, and print its name.

  -d, --directory     create a directory, not a file
  -u, --dry-run       do not create anything; merely print a name (unsafe)
  -q, --quiet         suppress diagnostics about file/dir-creation failure
```

`tempfile=$(mktemp)`とすれば一時ファイルのパスを得られる

`tempdir=$(mktemp -d)`とすれば、一時ディレクトリのパスを得られる
