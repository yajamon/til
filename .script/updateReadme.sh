#!/bin/bash

readonly ROOT=$( dirname $(dirname $(realpath $0) ) )
readonly TARGET=$ROOT/README.md

put_info() {
    echo "[$(date +%Y-%m-%d.%H:%M:%S.%N)] $1" >&2
}

put_info "start update README.md"

put_info "write header"
cat << EOT > $TARGET
# TIL

Today I Learned

素晴らしき書捨て

- - -

EOT


put_info "pick categories"
readonly CATEGORIES=$(find $ROOT -mindepth 1 -maxdepth 1 -name "[a-zA-Z]*" -type d | sort)

put_info "start write categories TOC"
cat << EOT >> $TARGET
## Categories

EOT

for p in $CATEGORIES
do
    category_name=$(basename $p)
    put_info "write category: $category_name"
    echo "- [${category_name}](#${category_name})" >> $TARGET
done

cat << EOT >> $TARGET

- - -

EOT

put_info "write content TOC"

for p in $CATEGORIES
do
    category_name=$(basename $p)
    put_info "write category: $category_name"
    echo "### ${category_name^}" >> $TARGET
    echo "" >> $TARGET

    for f in $(find $p -type f | sort)
    do
        title=$(head -1 $f)
        put_info "write content: $title"
        echo "- [${title#\# *}](${f#$ROOT/})" >> $TARGET
    done

    echo "" >> $TARGET
done

put_info "complete"
