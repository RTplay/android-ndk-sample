#!/bin/bash

CMAKE_BIN=/home/renz/android/cmake-3.17.0-Linux-x86_64/bin/cmake
if [ ! -d "./build" ]; then
  mkdir ./build
fi

cd ./build
$CMAKE_BIN .. -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=armeabi-v7a -DANDROID_NATIVE_API_LEVEL=23 -DANDROID_TOOLCHAIN=clang -DCMAKE_INSTALL_PREFIX=.. &&
make && make install && 
rm * -rf
$CMAKE_BIN .. -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DANDROID_NATIVE_API_LEVEL=23 -DANDROID_TOOLCHAIN=clang -DCMAKE_INSTALL_PREFIX=.. &&
make && make install &&
rm * -rf
$CMAKE_BIN .. -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=x86_64 -DANDROID_NATIVE_API_LEVEL=23 -DANDROID_TOOLCHAIN=clang -DCMAKE_INSTALL_PREFIX=.. &&
make && make install &&
rm * -rf
$CMAKE_BIN .. -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=x86 -DANDROID_NATIVE_API_LEVEL=23 -DANDROID_TOOLCHAIN=clang -DCMAKE_INSTALL_PREFIX=.. &&
make && make install &&
rm * -rf
cd ../
