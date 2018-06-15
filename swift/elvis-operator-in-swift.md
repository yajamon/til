# Swiftにエルビス演算子(?:)は無いが、Nil合体演算子(??)がある

ある式の結果がNilだった場合に、代わりの値を返却したいケースの構文。

```swift
let saved = UserDefaults.standard.string(forKey: "saveKey") ?? ""
```

## 参考URL

- [Basic Operators — The Swift Programming Language (Swift 4.2)](https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#//apple_ref/doc/uid/TP40014097-CH6-XID_124)
- [エルビス演算子 - Wikipedia](https://ja.wikipedia.org/wiki/%E3%82%A8%E3%83%AB%E3%83%93%E3%82%B9%E6%BC%94%E7%AE%97%E5%AD%90)
- [Null合体演算子 - Wikipedia](https://ja.wikipedia.org/wiki/Null%E5%90%88%E4%BD%93%E6%BC%94%E7%AE%97%E5%AD%90)
