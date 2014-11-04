#!/bin/bash

CWD=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
WORKSPACE_DIR=$HOME/workspace
TOOLCHAIN_DIR=/opt/toolchains

sudo mkdir -p $HOME/src $TOOLCHAIN_DIR
sudo chown $USER:$USER $HOME/src $TOOLCHAIN_DIR

for i in `ls $CWD`; do
    if [ -d $CWD/$i ]; then
        mkdir -p $WORKSPACE_DIR/$i
        cp $CWD/$i/crosstool.config $WORKSPACE_DIR/$i/.config
        pushd $WORKSPACE_DIR/$i;
        ct-ng build;
        popd
    fi
done
