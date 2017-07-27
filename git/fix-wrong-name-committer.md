# コミットログの間違ったcommitterの名前を修正する

filter-branchで修正する。

```sh
git filter-branch --commit-filter '
if [ "$GIT_AUTHOR_EMAIL" = "yajamon.tatsu@gmail.com" ]; then
    GIT_AUTHOR_NAME="yajamon";
    GIT_AUTHOR_EMAIL="yajamon.tatsuki@gmail.com";
    GIT_COMMITTER_NAME="yajamon";
    GIT_COMMITTER_EMAIL="yajamon.tatsuki@gmail.com";
    git commit-tree "$@";
else
    git commit-tree "$@";
fi' HEAD
```

- [Git - 歴史の書き換え](https://git-scm.com/book/ja/v1/Git-%E3%81%AE%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E3%83%84%E3%83%BC%E3%83%AB-%E6%AD%B4%E5%8F%B2%E3%81%AE%E6%9B%B8%E3%81%8D%E6%8F%9B%E3%81%88)
- [Git の Commit Author と Commiter を変更する - Qiita](http://qiita.com/sea_mountain/items/d70216a5bc16a88ed932)
