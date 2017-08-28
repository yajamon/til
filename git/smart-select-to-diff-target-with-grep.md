# 差分のあるファイル一覧から、grepでいい感じに特定ファイルのDiffを見る

```
git status --short
git diff $(git diff --name-only | grep $pattern)
```

## `git status --short`

変更の状況を確認するために使用する。

`git diff --name-only`ではなくこちらを使用するのは
追加したのか変更したのかをファイル名とともにいい感じに出してくれるため。

## `git diff $(git diff --name-only | grep $pattern)`

`$pattern`を絞り込みたい内容に合わせて変更する。
