#!/bin/sh

SCRIPT_PATH="$(dirname "$(realpath "$0")")"

cd "$SCRIPT_PATH"

echo '<!DOCTYPE html>' > index.html
echo '<html lang="en-US">' >> index.html
cat docs/head.html >> index.html

echo '<body>' >> index.html
markdown README.md >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html

echo 'Executing setup...'
sh scripts/set.sh docs/parser.conf index.html
sh scripts/set.sh docs/parser.conf README.md

rm -f .gitignore

