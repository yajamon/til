# シングルトンオブジェクトの作成方法

dispatch_onceを使った方法。

```objc
// SingletonObject.h
@interface SingletonObject: NSObject
+ (SingletonObject*)sharedSingletonObject;
@end
```

```objc
// SingletonObject.m
@implementation SingletonObject
static SingletonObject* _instance = nil;

+ (SingletonObject*) sharedSingletonObject {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _instance = [SingletonObject new];
    });
    return = _instance;
}
@end
```

`sharedSingletonObject()`のメソッドスコープ中に`static`つけたローカル変数書くだけでも期待した挙動させられるよ的な文言を見た気がするけど思い出せない。

## ~~できる？~~ できないってコンパイラに怒られた

```objc
+(SingletonObject*)sharedSingletonObject {
    static SingletonObject* _instance = [SingletonObject new];
    return _instance;
}
```

C言語の文脈からすれば`static`修飾子のついた行は一度しか実行されないから、とかなんとか聴いた気がする…
もしくはXcodeがコンパイル時に`dispatch_once`形式に実は変えちゃうんだよねーとかなんとか…

うろ覚えで書いたコードは動かなかったし`dispatch_once`形式のほうが明確だからそれでいいや


- [iOSでシングルトンクラスを定義する！ - Qiita](http://qiita.com/fakestarbaby/items/a96245991b1295ff0214)
- [iOSのシングルトンの話 - Qiita](http://qiita.com/yuky_az/items/27031ec5ca55a95d6209)
