#!/bin/sh
set -eu

rm -rf dist
mkdir -p dist
cp index.html login.html register.html forgot-password.html dashboard.html auth.js hisabai.css registration.css dist/
: > dist/.nojekyll

printf 'Static site ready in dist/\n'
