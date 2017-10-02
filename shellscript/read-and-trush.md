# readコマンドで先頭の単語を取り出す

マニュアル見たら「あぁなんだそういうことか」という感じなのだけれども。

`read`コマンドは標準入力から一行受け取り、単語を分割して引数に割り当てる。
単語を分割した結果、`read`の引数が不足していれば、最後の要素に余った単語を全て突っ込むようになっている。

よって、`read`の末尾にゴミ箱用の引数を置いておけばよい。

```bash
# _trushは使用しない予定
read -r param _trush
```

シェルスクリプトにて、不足パラメータの入力を促す際に利用できる。

```bash
param=$1
if [ -z $param ]; then
    echo "error: パラメータを入力してください。" >&2
fi
while [ -z $param ]; do
    echo -n "パラメータ: " >&2
    read -r param _trush
done
echo "param: $param"
```

# 参考URL

- [Linuxコマンド集 - 【 read 】 読み出したファイルを解釈する：ITpro](http://itpro.nikkeibp.co.jp/article/COLUMN/20060227/230866/)
