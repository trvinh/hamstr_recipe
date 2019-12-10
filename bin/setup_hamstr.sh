#!/bin/bash

sys="$(uname)" # Linux for Linux or Darwin for MacOS
echo "Current OS system: $sys"
flag=0

### check grep, sed and wget availability
echo "-------------------------------------"
echo "Checking .bash_profile/.bashrc, grep, sed/gsed and wget availability..."
grepprog='grep'
sedprog='sed'
wgetprog='wget'
if [ "$sys" == "Darwin" ]; then
    sedprog='gsed'
    grepprog='ggrep'
fi

# NOTE: install only available for Linux!
if [ -z "$(which $sedprog)" ]; then
    echo "$sedprog not found. Please install it first (e.g. using brew)!"
    flag=1
fi

if [ -z "$(which $grepprog)" ]; then
    echo "$grepprog not found. Please install it first (e.g. using brew)!"
    flag=1
fi

if [ -z "$(which $wgetprog)" ]; then
    echo "$wgetprog not found. Please install it first (e.g. using brew)!"
    flag=1
fi

if [ "$flag" == 1 ]; then exit 1; fi
echo "done!"

### download hamstr
echo "-------------------------------------"
echo "Downloading the latest version of HaMStR..."

wget https://github.com/BIONF/HaMStR/archive/master.tar.gz
tar xfv master.tar.gz
mv HaMStR-master HaMStR
rm master.tar.gz
cd HaMStR

### run hamstr setup
echo "-------------------------------------"
echo "Running setup..."
CURRENT=$(pwd)
chmod 755 $CURRENT/bin/setup_conda.sh
$CURRENT/bin/setup_conda.sh

exit 1
