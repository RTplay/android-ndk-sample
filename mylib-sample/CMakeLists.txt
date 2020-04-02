# for lib_sample

cmake_minimum_required (VERSION 2.8.1)

######################### Project settings #####################################
project(mylib-sample)
set(CMAKE_VERBOSE_MAKEFILE on)
#SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -O0")
#SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -O0 -pthread")

set(OPENSSL_INCLUDE_PATH /home/renz/android/AndroidWorkSpace/OpenSourceModule/OpensslDir/armeabi/include)
set(OPENSSL_LIB_PATH /home/renz/android/AndroidWorkSpace/OpenSourceModule/OpensslDir)
######## config inc&src&linklib settings and build #############################

include_directories(
    "inc"
    ${OPENSSL_INCLUDE_PATH}
)

file(GLOB SOURCES
    "src/*"
)

message(STATUS "ANDROID_ABI is " ${ANDROID_ABI})

link_directories("${OPENSSL_LIB_PATH}/${ANDROID_ABI}/lib")
link_libraries("${OPENSSL_LIB_PATH}/${ANDROID_ABI}/lib")

add_library(mylib-sample SHARED ${SOURCES})

target_link_libraries(mylib-sample
                        crypto ssl
)

######## Install targets ########
if (ANDROID_ABI STREQUAL "armeabi-v7a")
  install(TARGETS mylib-sample DESTINATION  lib/armeabi-v7a/)
elseif (ANDROID_ABI STREQUAL "arm64-v8a")
  install(TARGETS mylib-sample DESTINATION  lib/arm64-v8a/)
elseif (ANDROID_ABI STREQUAL "x86_64")
  install(TARGETS mylib-sample DESTINATION  lib/x86_64/)
elseif (ANDROID_ABI STREQUAL "x86")
  install(TARGETS mylib-sample DESTINATION  lib/x86/)
else ()
  install(TARGETS mylib-sample DESTINATION  lib/libx/)
endif ()