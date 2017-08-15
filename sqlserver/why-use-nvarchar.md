# SQLServerにUnicodeの文字列データを格納する場合はnvarcharを使用する

MySQLと同じ気持ちで`varchar`型の列を作って日本語を突っ込んだら文字化けした。

## nvarcharはUnicode文字列に対応している

`nvarchar`型を使えば文字化けせずにUnicode文字列を取り扱える。


## 余談

- `nchar`, `ntext`もある
- Unicode文字列定数は`N'もじれつ'`と書くことで定義できるとのこと

- [データ型 nvarchar varchar char の使い分けについて](https://social.msdn.microsoft.com/Forums/ja-JP/9c694b83-91a8-4395-ab09-b172078c5798/-nvarchar-varchar-char-?forum=sqlserverja)
- [nchar および nvarchar (Transact-SQL)](https://msdn.microsoft.com/ja-jp/library/ms186939(v=sql.120).aspx)
