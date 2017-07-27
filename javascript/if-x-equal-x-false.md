# if (x != x) はNaNチェック

ある変数の値がNaNであるかをチェックしている。
仕様として、`NaN == NaN`は`false`となることを利用したもの。

グローバル領域に定義された`isNaN()`よりも厳密性が高い。
`isNaN()`関数は引数をまず`Number`に変換してから判断する。
`"abc"`のような数値として取り扱いできない文字列は`true`が返ってくるが、
`""`の場合は`false`が返ってくる。

```js
if (x != x){
    // x is NaN
    // ...code...
}
```

ES6では`Number.isNaN()`が追加される。
こちらは値が厳密に`NaN`であるかを判断して`true|false`を返却してくれる。

- [isNaN() - JavaScript | MDN](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/isNaN#Useful_special-case_behavior)
