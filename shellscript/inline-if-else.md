# 短絡評価を用いて三項演算子のように処理を使い分けるインラインコマンド

三項演算子と、ちゃんと`$?`に反映される結果をreturnしてるから良いんだよ多分。

これが

```sh
is_osx() {} # 環境がmac osxか判定する関数

if is_osx; then
    alias="ls -G"
else
    alias="ls --colors"
fi
```

インラインで書くとこうなる

```sh
if is_osx; then alias="ls -G"; else alias="ls --colors"; fi
```

論理演算子による短絡評価を用いて以下のように書くことができる

```sh
is_osx && alias="ls -G" || alias="ls --colors"
```
