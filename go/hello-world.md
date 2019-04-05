# Hello world

```go
package main

import (
	f "fmt"
	. "strings"
)

func main() {
	// 同じ意味（関数の内部で行う場合にできる方法
	// var message string = "hello world"
	// message := "hello world"

	// 定数化
	const message string = "hello world"

	// fmt.Println("hello world")
	f.Println(ToUpper(message))
}
```
