# 覚えておきたい変数展開

## 置換

```bash
txtfile='example.txt'
echo ${txtfile/txt$/md}
# example.md
```

## 末尾削除

`%`で末尾削除ができる。

```bash
txtfile='example.txt'
echo ${txtfile%.txt}
# example

# パターンも対応している
txtfile='example.text'
echo ${txtfile%.t*t}
# example
```

`%` か `%%`かで、最短一致か最長一致か使い分けられる。


```bash
# 最短一致
txtfile='example.text.text'
echo ${txtfile%.t*t}
# example.text

# 最長一致
txtfile='example.text.text'
echo ${txtfile%.t*t}
# example
```

- [Man page of BASH](https://linuxjm.osdn.jp/html/GNU_bash/man1/bash.1.html)
    - "パラメータの展開"
