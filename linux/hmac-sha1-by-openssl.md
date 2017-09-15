# OpensslでHMAC-SHA1ハッシュ化

```bash
echo "value" | openssl dgst -sha1 -hmac
```

ハッシュ部分だけを取り出す場合、`cut`コマンドなどを使う。

```bash
echo "value" | openssl dgst -sha1 -hmac | cut -d" " -f2
```

キーを与えることができる

```bash
echo "value" | openssl dgst -sha1 -hmac $keyString
```

改行の有無でハッシュ値は変わる

```bash
echo "value" | openssl dgst -sha1 -hmac
# (stdin)= 2b3b7f6975d8f776754212874dbc38b271087b50
echo -n "value" | openssl dgst -sha1 -hmac
# (stdin)= f32b67c7e26342af42efabc674d441dca0a281c5
```

実はバイナリ状にハッシュを生成していて、16進数の数字として表現してくれている。
`-binary`オプションを付けることでバイナリ状の値を出力する。

```bash
echo -n "value" | openssl dgst -sha1 -hmac
# (stdin)= f32b67c7e26342af42efabc674d441dca0a281c5
echo -n "value" | openssl dgst -binary -sha1 -hmac | hexdump -C
# 00000000  f3 2b 67 c7 e2 63 42 af  42 ef ab c6 74 d4 41 dc  |.+g..cB.B...t.A.|
# 00000010  a0 a2 81 c5
```

バイナリ状のハッシュをbase64にする例。

```bash
echo -n "value" | openssl dgst -binary -sha1 -hmac | base64
# 8ytnx+JjQq9C76vGdNRB3KCigcU=
```
