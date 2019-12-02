#!/bin/bash
set -e

BINARY_HOME=$PREFIX/bin
TESTPKG_HOME=$PREFIX/$PKG_NAME-$PKG_VERSION

# Copy source to the conda environment
mkdir -p $TESTPKG_HOME
cp -R $SRC_DIR/* $TESTPKG_HOME/

# Create symbolic links for a5_miseq's launch script
mkdir -p $BINARY_HOME
ln -s $TESTPKG_HOME/bin/setup_hamstr.sh $BINARY_HOME/setup_hamstr
chmod +x $BINARY_HOME/setup_hamstr

export PKGTEST="$BINARY_HOME"
