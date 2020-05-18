# StringからIntに変換する

JavaScriptばっかやってるから`parseInt`しか頭に出てこない。
JSONSerializer.jsonObjectにかけちゃうぞこのー。

## 結論

```swift
let str = "123"
let num = Int(str)!
```

### NSString -> NSNumber

NSNumberはDoubleだったりBoolだったりを内包できる抽象度が高めの型なので、
Int等の具体的な方に変換してからNSNumberにするほうが良さそう。

```swift
let str = NSString(string: "123")
let num = Int(str as String)! as NSNumber
```

## 参考リンク

- https://developer.apple.com/documentation/swift/int
