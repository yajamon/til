# CentOSのバージョン情報を確認する

`/etc/redhat-release`から確認できる。

```bash
cat /etc/redhat-release
# CentOS Linux release 7.3.1611 (Core)
```

`/etc/redhat-release`はシンボリックリンクで、実体は`/etc/centos-release`にある。
個人的にはredhatを使う予定はないので`centos-release`でもいいんじゃないかなと思う。

`/etc/os-release`にはもっと細かく情報が詰まっていた。
シェルスクリプトとして実行するとバージョン情報関連の変数が得られるので、「シェルスクリプトからバージョン情報が欲しい！」と思ったら`source`コマンドで取り込んでも良いかもしれない。

```sh
source /etc/os-release
echo $VERSION_ID
```

- [CentOSのバージョン確認コマンドとアーキテクチャ確認コマンド | mawatari.jp](http://mawatari.jp/archives/check-centos-version)
