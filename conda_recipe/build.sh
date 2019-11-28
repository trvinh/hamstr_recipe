#!/bin/bash
set -e

BINARY_HOME=$PREFIX/bin
TESTPKG_HOME=$PREFIX/$PKG_NAME-$PKG_VERSION

# Run setup
./bin/setup.sh

# Copy source to the conda environment
mkdir -p $TESTPKG_HOME
# cp -R $SRC_DIR/* $TESTPKG_HOME/
cp -R * $TESTPKG_HOME/

# Create symbolic links for a5_miseq's launch script
mkdir -p $BINARY_HOME
#ln -s $TESTPKG_HOME/bin/testPkg.pl $BINARY_HOME/
ln -s $TESTPKG_HOME/bin/*.pl $BINARY_HOME/
#chmod +x $BINARY_HOME/testPkg.pl
chmod +x $BINARY_HOME/*.pl

export PKGTEST="$BINARY_HOME"
