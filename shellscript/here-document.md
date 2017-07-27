# シェルスクリプトでヒアドキュメント

## 書き方

```bash
cat << EOT
line 1
line 2
line 3
EOT
```

> ヒアドキュメントを理解するうえで重要なのは、ヒアドキュメントは標準入力として扱われる、ということです。
> 文字列リテラルでないことに注意してください。
>
> [bashのヒアドキュメントを活用する - Qiita](http://qiita.com/take4s5i/items/e207cee4fb04385a9952)

## 変数代入

サブシェル上で実行して結果を受け取る。

```bash
doc=$(cat << EOT
line 1
line 2
line 3
EOT
)
```

- [bashのヒアドキュメントを活用する - Qiita](http://qiita.com/take4s5i/items/e207cee4fb04385a9952)
