# SQLite3にクエリを投げてみる

## Schema

```sql
CREATE TABLE articles (id integer primary key autoincrement not null, title text, body text);
```

## コード

```c
#include <stdio.h>
#include <stdlib.h>
#include <sqlite3.h>

int exec_callback(void *, int, char**, char**);

int main(void){
    int result = 0;
    sqlite3 *connection = NULL;
    char* err_msq = NULL;

    result = sqlite3_open("./sample.db", &connection);
    if( result != SQLITE_OK ) { exit(-1); }

    result = sqlite3_exec(
            connection,
            "select * from articles",
            exec_callback,
            NULL,
            &err_msq
    );
    if( result != SQLITE_OK ) {
        sqlite3_close(connection);
        sqlite3_free(err_msq);
        exit(-1);
    }

    result = sqlite3_close(connection);
    if( result != SQLITE_OK ) { exit(-1); }

    return 0;
}

// Selectを実行した場合、1行ごとに呼び出される
int exec_callback(void *param, int col_count, char **row_text, char **col_name) {
    printf("{\n");

    for(int index=0; index<col_count; index++){
        printf("    %s : %s\n", col_name[index], row_text[index]);
    }

    printf("}\n");
    return 0;
}
```
