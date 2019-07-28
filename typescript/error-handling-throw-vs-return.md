# Error handling を考える: throw vs return

- DDDに取り組もうとしていると、モデルに気を使う
- ファクトリに与えたパラメータが不適切な場合がある
- 有効ではないパラメータが与えられたのなら、ファクトリはオブジェクトを生成しないし、なんらかの異常を告げる必要がある
- 入力フォームがあるシチュエーション
- たとえばNameオブジェクトは空文字列を受け入れない
- TypeScriptの型推論、IDEの入力支援を受けたい

## 対応パターン

- throw Error
- return tuple
- return null
- return simple Result

### throw Error

```ts
// domain layer
class Name {
    readonly value: string;
    constructor(value: string){
        if (value === '') { throw Error("空文字はだめです"); }
        this.value = value;
    }
}
// presentation layer
function handleSubmit(parameters) {
    let name:Name;
    try {
        name = new Name(parameters.name);
    } catch (error) {
        displayErrorMessage(error.message);
        return false;
    }
    // ...
    return true;
}
```

- try-catchで囲む必要がある
- 利用者側は、ファクトリがthrowするか意識しなければいけない
    - シグネチャに現れない情報
        - 型の支援が受けられない
    - でなければ不正な値でUncaught errorになってしまう
    - throwされたものがErrorオブジェクトであるかさえも確認する必要がある
- IDEがthrowableであることを教えてくれれば、コストが下がる

### return tuple

```ts
// domain layer
class Name {
    readonly value: string;
    private constructor(value: string){
        this.value = value;
    }
    static create(name:string): [Name, null] | [null, Error]{
        if (value === '') {
            return [null, Error("空文字はだめです")];
        }
        return [new Name(name), null];
    }
}
// presentation layer
function handleSubmit(parameters) {
    const [name, error] = Name.create(parameters.name);
    if (error) {
        displayErrorMessage(error.message);
        return false;
    }
    // 分割代入後にerrorの型が定まっても、nameの型が定まったとは扱われない
    doSomething(name!);
    // ...
    return true;
}
```

- 利用者側は、ファクトリがnullを返すか意識しなければいけない
    - シグネチャに現れる情報
        - 型の支援が受けられる
- 分割代入である程度すっきり書けるが、あと一歩型推論のパワーがほしい
    - 上記でnameの方が定まらないところとか

```ts
tuple: [Name, null] | [null, Error];
if (tuple[1]) {
    const [, error] = tuple;
    return;
}
const [name,] = tuple;
doSomething(name);
```

`tuple`の型が定まってからの分割代入は、安定した型情報になる

### return null

```ts
// domain layer
class Name {
    readonly value: string;
    private constructor(value: string){
        this.value = value;
    }
    static create(name:string): Name?{
        if (value === '') { return null; }
        return new Name(name);
    }
}
// presentation layer
function handleSubmit(parameters) {
    const name = Name.create(parameters.name);
    if (!name) {
        displayErrorMessage("nameの内容が不正です");
        return false;
    }
    // ...
    return true;
}
```

- 利用者側は、ファクトリがnullを返すか意識しなければいけない
    - シグネチャに現れる情報
        - 型の支援が受けられる
- nullだったという情報しかないので、「何かがまずかった」としか表現できない

###  return simple Result

参考資料より

- https://medium.com/@dhruvrajvanshi/making-exceptions-type-safe-in-typescript-c4d200ee78e9

```ts
type Ok<T> = {
    isError: false;
    ok: T;
};
type Err<E> = {
    isError: true;
    error: E;
};
type Result<T, E> = Ok<T> | Err<E>;
const ok: <T>(value: T) => Ok<T> = (v) => ({ isError: false, ok: v });
const err: <E>(error: E) => Err<E> = (e) => ({ isError: true, error: e });
```

```ts
// domain layer
class Name {
    readonly value: string;
    private constructor(value: string){
        this.value = value;
    }
    static create(name: string): Result<Name, Error> {
        if (name === '') { return err(new Error("空文字はだめです")); }
        return ok(new Name(name));
    }
}
// presentation layer
function handleSubmit(parameters) {
    const name = Name.create(parameters.name);
    if (name.isError) {
        displayErrorMessage(name.error);
        return false;
    }
    // 分割代入後にerrorの型が定まっても、nameの型が定まったとは扱われない
    doSomething(name.ok);
    // ...
    return true;
}
```

- 利用者側は、ファクトリが返すResultを意識する
    - シグネチャに現れる情報
        - 型の支援が受けられる

## 脱線

### `validation()` を作る

- パラメータを事前に検証する関数を用意する
- 過去、CakePHPを使っていた経験から
- ファクトリの中で利用するか？
    - しない: ファクトリ内の異常値処理と二重管理になる
    - する: 結局異常なパラメータを受けたときの対処が必要
- いずれにせよ、ファクトリを呼ぶ前に必ず使用してくれる保証はない
- 検証処理を分離するprivateメソッド程度の役目しか果たせない
