# イメージ名でプロセスをkillする

```ps1
taskkill /im $imageName
```

以下のようにすれば[無限ループで増殖する](../shellscript/bash-explosion.md)`bash.exe`に対抗することができる。

```ps1
While(1) { taskkill /im bash.exe /f }
```

- [taskkill コマンドでプロセスを強制終了させる | Windows 7](http://tooljp.com/qa/D6F57AA3E7C9159549257BCF0055CB7C.html)
