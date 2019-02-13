# 現在のbranchを(branch nameを書かずに)リモートにPushしたい

## 結論

```console
git push -u origin $(git branch --contains | cut -d' ' -f2)
```

`git branch --contains=[ref]`はrefの示すcommitを含むbranchを列挙する。
特に指定しなかった場合、`HEAD`を参照先とする。

branchをチェックアウトしている前提なので、cutコマンドで`*`を削っている。

