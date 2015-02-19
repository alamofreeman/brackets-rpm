#!/bin/sh

# $1: version
# $2: brackets branch/tag (usually release-x.x)
# $3: brackets-shell branch/tag (usually release-x.x)

rm -rf brackets
rm -rf brackets-shell

git clone https://github.com/adobe/brackets.git
git clone https://github.com/adobe/brackets-shell.git

cd brackets && git checkout $2 && git submodule update --init && rm -rf .git && cd ..
cd brackets-shell && git checkout $3 && git submodule update --init && rm -rf .git && cd ..

tar -cvzf SOURCES/brackets-$1.tar.gz brackets
tar -cvzf SOURCES/brackets-shell-$1.tar.gz brackets-shell

rm -rf brackets
rm -rf brackets-shell
