# 汎用ポインタの使い方を知る

JavaScriptのtoString()に思いを馳せて、一見同じ関数の呼び出しを しているようで、
別々の処理を行う方法について考えていた。

void \*, 汎用ポインタを使えばよさそうだった。

```c
#include <stdio.h>

void toStringInt(void *);
void toStringString(void *);

typedef struct {
    void *value;
    void (*toString)(void *value);
} Object;

int makeObjectByInt(Object *object, int value);
int makeObjectByString(Object *object, const char *value);

int main(void){
    printf("hello world!!\n");
    // Object empty = {NULL, NULL};

    Object num = {NULL, NULL};
    makeObjectByInt(&num, 10);
    printf("%x\n", num);
    printf("%x\n", num.value);
    printf("%x\n", num.toString);
    num.toString(num.value);

    Object str = {NULL, NULL};
    makeObjectByString(&str, "hello struct world.");
    str.toString(str.value);
}

int makeObjectByInt(Object *object, int value){
    printf("&object  : %x\n", object);
    printf("&value   : %x\n", object->value);
    printf("&toString: %x\n", object->toString);

    object->value = &value;
    printf("set value\n");
    object->toString = toStringInt;
    printf("set toString\n");

    printf("&value   : %x\n", object->value);
    printf("&toString: %x\n", object->toString);
    return 0;
}

int makeObjectByString(Object *object, const char *value){
    printf("&object  : %x\n", object);
    printf("&value   : %x\n", object->value);
    printf("&toString: %x\n", object->toString);

    object->value = &value;
    printf("set value\n");
    object->toString = toStringString;
    printf("set toString\n");

    printf("&value   : %x\n", object->value);
    printf("&toString: %x\n", object->toString);
    return 0;
}

void toStringInt(void *value){
    int *val = (int *)value;
    printf("number: %d\n", *val);
}

void toStringString(void *value){
    char **val = (char **)value;
    printf("string: %s\n", *val);
}
```
