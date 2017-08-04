# 世界のナベアツ問題

3の倍数と3のつく数字の時にアホになるという芸があった

```js
for(let i=1; i<=40; i++){
    console.log(getString(i));
}

function getString(num){
    let strnum = String(num);
    if (isMultipleOfThree(num) || hasThree(num)){
        return strnum+" !?!?!?";
    }
    return strnum+ " !"
}

function isMultipleOfThree(num){
    return num % 3 == 0;
}

function hasThree(num){
    let strnum = String(num);
    return strnum.includes("3");
}
```

FizzBuzzのランクアップ版くらいの位置づけという認識。

文字列使うと探しやすいね。

## 文字列を使わないで3の付く数字を探す

10の倍数で下の桁から一桁ずつ確認していく。

```js
function hasThree(num){
    let base = 1
    while((num / base) >= 1){
        if (Math.floor(num / base) % 10 == 3){
            return true;
        }
        base *= 10;
    }
    return false;
}
```
