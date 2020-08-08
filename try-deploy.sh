#!/usr/bin/env bash
download()
{
  FILE_NAME="${1##*/}"
  if [ ! -f "$FILE_NAME" ]; then
    echo "Downloading $1"
    wget --quiet $1
    chmod +x $FILE_NAME
  fi
}

download https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
download https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86_64.AppImage
download https://github.com/linuxdeploy/linuxdeploy-plugin-appimage/releases/download/continuous/linuxdeploy-plugin-appimage-x86_64.AppImage

mkdir -p build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make
make install DESTDIR=testingdeploy
cd ..

./linuxdeploy-x86_64.AppImage --appdir build/testingdeploy --plugin qt --output appimage
