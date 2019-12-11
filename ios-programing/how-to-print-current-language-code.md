# LanguageCode を取得する方法

## 背景

- ユーザーの言語情報が必要になった
- リージョン情報には興味がなかった

## 結論

- iOS 7 以降をサポートするなら、`Locate`から取得すればいいと思う。

```swift
func printLanguageCode {
    let locale = Locale.current
    print(locale.languageCode)
}
```

## iOS 7 より前ではどうやって取得していたか

`NSUserDefaults`に使用できる情報が格納されている。

```objc
+ printLanguageCode {
    // 配列で文字列がおいてあるので引っ張り出す。
    NSString *language = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    NSLog(@"%@", language);
}
```

### AppleLanguages はどこから来ているっぽいのか

`[[NSUserDefaults standardUserDefaults] volatileDomainNames]`を確認すると、DomainNameの一覧が得られる。
これを`[[NSUserDefaults standardUserDefaults] volatileDomainForName:]`に食わせてみたところ、`AppleLanguages`が得られた。

## 参考リンク

- https://developer.apple.com/documentation/foundation/locale
- https://developer.apple.com/documentation/foundation/nsuserdefaults
