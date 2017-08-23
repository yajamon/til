# OpensslでHMAC-SHA1ハッシュ化

```bash
echo "value" | openssl dgst -sha1 -hmac
```

ハッシュ部分だけを取り出す場合、`cut`コマンドなどを使う。

```bash
echo "value" | openssl dgst -sha1 -hmac | cut -d" " -f2
```
