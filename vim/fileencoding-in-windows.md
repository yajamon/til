# WindowsでVimを使う時にUTF-8でファイル出力をしたい

編集中、`:set fileencoding=utf-8`を実行した後に書き込めば良い。

## 新規ファイルを作る際に、自然とUTF-8で作成する

以下をvimrcに定義しておく。

```vim
set fileencoding=utf-8
```

この設定はファイルを書き込む時に使用される。

vimrcで設定したからといって、常に必ずこのエンコーディングで修正されるとは限らない。
`fileencodings`の項目にマッチしたファイルを開いたとき、マッチしたエンコーディングで`fileencoding`は上書きされる。

これはファイルのエンコーディングを維持する働きをもたらす。

## 参考資料

- [options #fileencoding - Vim日本語ドキュメント](https://vim-jp.org/vimdoc-ja/options.html#'fileencoding')
