# 一時ディレクトリにローカルリポジトリをクローンする

```sh
TempDir=$(mktemp -d -t prefix)
git clone -l /path/to/repo $TempDir

cd $TempDir
```
