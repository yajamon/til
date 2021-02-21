# Rustで binary\_search

binary\_searchを実装してみた。

```rust
let sorted: Vec<usize> = vec![1, 2, 3, 4, 5];
let target = 4;

let mut found = None;
let mut begin = 0;
let mut end = sorted.len();
while begin < end {
    let index: usize = begin + (end - begin) / 2;
    let value = sorted[index];
    if value == target {
        found = Some(index);
        break;
    } else if value < target {
        begin = index + 1;
    } else if value > target {
        end = index;
    }
}
assert_eq!(found, Some(3));
```

なお、`Vec`に`binary_search`というメソッドは用意されている。

```rust
let sorted: Vec<usize> = vec![1, 2, 3, 4, 5];
let target = 5;

let found = sorted.binary_search(&target);

assert_eq!(found, Ok(4));
```

自前で書いたケースは`Option`としたが、組み込みの`binary_search`は`Result`を結果に返した。
これらの型の使い分けは難しそうに思う。成功・失敗の概念が存在するかどうか、が分岐点だろうか。
