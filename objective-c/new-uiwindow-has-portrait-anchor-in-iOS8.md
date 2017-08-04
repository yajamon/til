# iOS8にて、[UIWindow new]で生成したWindowのframe原点が、Landscape状態の画面にも関わらず、Portrait左上になってしまう現象を解決した

iOS 8から`frame`を考える上でスクリーン上の左上が原点となるようになった。
しかし[UIWindow new]を使用するにあたって、iOS 8系でのみ発生する不具合のような挙動に直面した。

## どういう状況で起こるか

- `[UIWindow new]`でWindowを生成する
- 生成したWindowは`[vc shouldAutorotate] == NO`となる`ViewController`を`rootViewController`に持つ
- 生成したWindowの`frame`をフルスクリーンにしようと`[UIScreen mainScreen].bounds`の値を使う
- Landscape状態でWindowを生成・表示する

以下は要点を抽出したコード。

```objc
// SampleViewController.h
@interface SampleViewController : UIViewController
@end
// SampleViewController.m
@implementation SampleViewController
- (BOOL)shouldAutoRotate {
    return NO;
}
@end
```

```objc
// ViewController.m
@interface ViewController ()
@property (nonatomic) UIWindow *w;
@end

@implementation ViewController
- (IBACtion)obenWindow:(UIButton*)sender {
    UIWindow *w = [UIWindow new];
    w.frame = [UIScreen mainScreen].bounds;
    w.rootViewController = [SampleViewController new];

    self.w = w;
    [self.w makeKeyAndVisible];
}
@end
```

iOS 8だけ、UIScreenの原点と生成したWindowの原点が異なっている。

- アプリケーションの`frame`の原点を見えているスクリーンの左上に持つ
- `[UIWindow new]`によって生成された`frame`の原点を`Portrait`状態の左上に持つ

## HACKに解決

`shouldAutoRotate`が`YES`なUIViewControllerを持たせた上で`makeKeyAndVisible`かけたら上手くいくんじゃね？という発想のもと、以下のようにしたところ上手くいった。

```objc
- (IBACtion)obenWindow:(UIButton*)sender {
    UIWindow *w = [UIWindow new];
    w.frame = [UIScreen mainScreen].bounds;

    // HACK: iOS 8系にてShouldAutoRotate == NO のViewControllerを
    //       rootViewControllerに持ってmakeKeyAndVisibleを実行すると
    //       アプリケーションのInterfaceOrientationに関わらず
    //       InterfaceOrientationPortrait状態のWindowが表示されてしまう
    w.rootViewController = [UIViewController];

    self.w = w;
    [self.w makeKeyAndVisible];
    w.rootViewController = [SampleViewController new];
}
```

直前まで表示されていたWindowのInterfaceOrientationを元に、表示したいWindowにtransformかけるしかないのか…？という悩みから解決されて最高に気分がいい。・

- [swift - iOS 8 - UIWindow Orientation Is Always Portrait - Stack Overflow](https://stackoverflow.com/questions/26916009/ios-8-uiwindow-orientation-is-always-portrait)
    - 読んだ時別件かなと思ったけど、解決した今、たしかにこの追記がベストな回答だと理解した
