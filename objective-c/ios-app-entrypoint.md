# iOSアプリのエントリーポイントを調べる

## 前提

- Xcode 8.2.1で確認した
- 探す対象
    - `UIApplicationDelegate`を実装した使用するクラス
    - 最初に使用する`UIViewController`系クラス
        - 必然最初に使用するStoryboardも
- [Swift版はこちら](../swift/ios-app-entrypoint.md)

## 本題

### `UIApplicationDelegate`を実装した使用するクラスを探す

1. `main.m`を探す
2. `UIApplicationMain()`の引数になっているクラスを調べる
    - Xcodeでプロジェクト作成直後の場合
        - `UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]))`
        - `AppDelegate`がApplicationDelegateとして使用される

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
