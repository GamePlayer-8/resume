#!/bin/sh

SCRIPT_PATH="$(dirname "$(realpath "$0")")"

cd "$SCRIPT_PATH"

echo '<!DOCTYPE html>' > index.html
echo '<html lang="en-US">' >> index.html
cat res/head.html >> index.html

echo '<body>' >> index.html
markdown README.md >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html

echo 'Executing setup...'
sh scripts/set.sh res/parser.conf index.html
sh scripts/set.sh res/parser.conf README.md

cp res/icon.ico favicon.ico
cp res/icon.png favicon.png
cp res/icon.webp favicon.webp

rm -f .gitignore
