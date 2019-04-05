# 基本的な処理

```go
package main

import "fmt"

func main() {
	fmt.Println("vim-go")
	a, b := 10, 100
	if a > b {
		fmt.Println("a is larger than b")
	} else if a < b {
		fmt.Println("a is smaller than b")
	} else {
		fmt.Println("a equals b")
	}

	// すべての繰り返し表現はforで行われる
	for i := 0; i < 10; i++ {
		fmt.Println(i)
	}

	// 他言語ではwhileとなるような処理
	n := 0
	for n < 10 {
		fmt.Printf("n = %d\n", n)
		n++
	}

	// 無限ループも
	m := 0
	for {
		m++
		if m > 10 {
			break
		}
		if m%2 == 0 {
			continue
		}
		fmt.Println(m)
	}
}
```
