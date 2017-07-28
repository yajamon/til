# iOSアプリのエントリーポイントを調べる

## 前提

- Xcode 8.2.1で確認した
- 探す対象
    - `UIApplicationDelegate`を実装した使用するクラス
    - 最初に使用する`UIViewController`系クラス
        - 必然最初に使用するStoryboardも
- [iOS版はこちら](../objective-c/ios-app-entrypoint.md)

## 本題

### `UIApplicationDelegate`を実装した使用するクラスを探す

#### `main.swift`がない

1. プロジェクト全体に対して`@UIApplicationMain`の検索をかける

#### `main.swift`がある

1. `main.swift`を開く
2. `UIApplicationMain()`の引数になっているクラスを調べる
    - 例えば
        - `UIApplicationMain(Process.argc, Process.unsafeArgv, nil, NSStringFromClass(AppDelegate))`
        - `AppDelegate`がApplicationDelegateとして使用される

main.swiftに関する公式リファレンスは見つけていない。

### 最初に使用する`UIViewController`系クラスを探す

1. Projectを開き、Targetを調べたいアプリに指定する
2. Build Settingsから`Packaging -> Info.plist File`の項目を確認する
    - Xcodeでプロジェクト作成直後の場合
        - `プロジェクトディレクトリ名/Info.plist`
3. Info.plistを開き`Main storyboard file base name`の項目を見ると起動時に使用されるstoryboardがわかる
    - Xcodeでプロジェクト作成直後の場合
        - `Main.storyboard`
    - ちなみにInfo.plistを開き`Launch screen interface file base name`の項目を見ると、Launch時に使用するファイルの名前が確認できる。
        - だいたいstoryboardかxib
4. 起動時に使用されるStoryboardを開き、Initial View Controllerを探す
    - Xcodeでプロジェクト作成直後の場合
        - 素のViewControllerがある
5. Initial View ControllerのCustom Classを見る
    - Xcodeでプロジェクト作成直後の場合
        - `ViewController`

- [Swift での main 関数の実装方法と起動時引数の扱い方](https://ez-net.jp/article/BC/vWrNTeBO/85hmtcwh9W3Y/)
- [Swiftさん、アレないっす – Wano Developers Blog](http://developers.wano.co.jp/295/)
