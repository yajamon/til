#!/bin/bash

readonly ROOT=$( dirname $(dirname $(realpath $0) ) )
readonly TARGET=$ROOT/README.md
readonly HEADER=$(cat << EOT
# TIL

Today I Learned

- - -
EOT
)

readonly CATEGORIES=$(find $ROOT -mindepth 1 -maxdepth 1 -name "[a-zA-Z]*" -type d)

{
    echo "$HEADER"
    echo ""
} > $TARGET

{
    echo "## Categories"
    echo ""
} >> $TARGET

for p in $CATEGORIES
do
    category_name=$(basename $p)
    echo "- [${category_name}](#${category_name})" >> $TARGET
done

{
    echo ""
    echo "- - -"
    echo ""
} >> $TARGET

for p in $CATEGORIES
do
    category_name=$(basename $p)
    echo "### ${category_name^}" >> $TARGET
    echo "" >> $TARGET

    for f in $(find $p -type f)
    do
        title=$(head -1 $f)
        echo "- [${title#\# *}](${f#$ROOT/})" >> $TARGET
    done

    echo "" >> $TARGET
done
