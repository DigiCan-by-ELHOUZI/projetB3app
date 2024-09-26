#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'workshop'
git push -f git@github.com:DigiCan-by-ELHOUZI/projetB3app.git main:gh-pages

cd -
