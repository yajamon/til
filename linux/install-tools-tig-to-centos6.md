# CentOS6に`tig`をインストールした

rpmforgeとか使った手順が出てるが母体がお亡くなりになってる。

仕方ないので`make`インストールをした。あまり気は進まない。

## 前提

- CentOS6にインストールする。
- install先は`/usr/local/bin`とする。
    - `dotfiles`に`bin`も含めちゃってるから
- マルチバイトに対応させる。

## 手順

[インストールマニュアルに書いてあること](https://jonas.github.io/tig/INSTALL.html)を実施した。

素のままインストールすると、マルチバイト文字が文字化けしてしまうため、いくつかオプションを付与する。

1. 依存パッケージの用意
    - git-core
    - ncurses|ncursesw
        - ncurseswが必要。
        - `devel`パッケージのインストールが必要。
        - `yum install -y ncurses-devel`
    - iconv
2. `LDLIBS=-lncursesw CPPFLAGS=-DHAVE_NCURSETW_CURSES_H ./configure`
3. `make prefix=/usr/local`
4. `sudo make install prefix=/usr/local`
