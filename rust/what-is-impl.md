# implとは何か？

Rustチュートリアルを進めていたらこんなコードに遭遇した。

```rust
struct Philosopher {
    name: String,
}
impl Philosopher {
    fn new(name: &str) -> Philosopher {
        Philosopher {
            name: name.to_string(),
        }
    }
    fn eat(&self){
        println!("{} is done eating.", self.name);
    }
}
fn main() {
    let p1 = Philosopher::new("Philosopher name");
}
```

`struct`はC言語をかじっていたのでなんとなくわかる。
`impl`が定義済み`struct`と同じ名前になっているが特に怒られない、むしろそういうもののよう。

- Philosopher#new は関連関数で
- Philosopher#eat はメソッドである
    - メソッドは明示的なselfパラメータを取る
- selfパラメータがある->メソッド、selfパラメータがない-> 関連関数

objective-cにおける`@interface`と`@implements`のような関係に見えてきた。
@propetyとかそういうの無し結構違うんだけども。

- [食事する哲学者](https://rust-lang-ja.github.io/the-rust-programming-language-ja/1.6/book/dining-philosophers.html)
- [メソッド構文](https://rust-lang-ja.github.io/the-rust-programming-language-ja/1.6/book/method-syntax.html)
