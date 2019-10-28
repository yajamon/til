# 複数のbranchをぱぱっとpullする

## ゴリ押しコマンドライン。

branchのリストを抽出して、whileループでswitch && pullを順繰りに繰り返すだけ。

```sh
git fetch
git branch -l $pattern | tr '*' ' ' | ( while read branchName
do
    git switch "$branchName" && git merge --ff-only origin/"$branchName"
done
)
```
