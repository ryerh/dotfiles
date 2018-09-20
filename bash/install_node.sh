#!/bin/bash -e
#
# npm config set prefix $HOME/.local

WORKDIR="$(mktemp -d)"
DESTDIR="$HOME/.local"

NODE_VERSION="${1:-8}"
MIRROR_PREFIX="https://npm.taobao.org/mirrors/node/latest-v${NODE_VERSION}.x"

curl -Lo "$WORKDIR/shasum" "$MIRROR_PREFIX/SHASUMS256.txt"
LATEST=$(grep -io "node-.*-$(uname)-x64.tar.xz" "$WORKDIR/shasum")

curl -Lo "$WORKDIR/node.txz" "$MIRROR_PREFIX/$LATEST"

mkdir -p $DESTDIR/opt
rm -rf "$DESTDIR/opt/node-v${NODE_VERSION}*"

tar -xf "$WORKDIR/node.txz" -C $DESTDIR/opt
rm -rf $WORKDIR

mkdir -p "$HOME/.local/bin"
for bin in $(ls $DESTDIR/opt/node-v${NODE_VERSION}*/bin/*); do
  echo "Linking $bin"
  ln -sfn $bin $DESTDIR/bin/$(basename $bin)
done
