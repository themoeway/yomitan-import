#!/bin/sh

mkdir -p dst
mkdir -p yomichan-import

# TODO: properly output as yomitan
export CXX=x86_64-w64-mingw32-g++.exe
export CC=x86_64-w64-mingw32-gcc.exe
go build foosoft.net/projects/yomichan-import/yomichan
go build -ldflags="-H windowsgui" foosoft.net/projects/yomichan-import/yomichan-gtk

mv yomichan.exe yomichan-import
mv yomichan-gtk.exe yomichan-import

7za a dst/yomichan-import_windows.zip yomichan-import/*.exe
