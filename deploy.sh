#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'workshop'
git push -f git@github.com:DigiCan-by-ELHOUZI/mis.git master:gh-pages

cd -
