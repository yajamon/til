# gitのコミットハッシュを見て、処理を続行するか判断する

## 結論

`git rev-parse`でコミットハッシュを取得できる。

たとえば、リモートで変更があるかどうかによって、処理を分岐させることができる。

```bash
git remote
# origin
# upstream

git fetch --all --prune

if [ $(git rev-parse master) = $(git rev-parse upstream/master) ]; then
    echo "Already up-to-date" >&2
    exit 0;
fi

# heavy logic
git checkout master && git merge --ff upstream/master && git push
make
```

## 参考リンク

- [gitでハッシュ値を取得 - Qiita](https://qiita.com/quattro_4/items/55e99a2c008c6875f267)
