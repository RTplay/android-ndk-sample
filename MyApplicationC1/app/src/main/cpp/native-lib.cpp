#include <jni.h>
#include <string>
#include "common.h"

extern "C" JNIEXPORT jstring JNICALL
Java_com_example_myapplicationc1_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    char aaa[33];
    return env->NewStringUTF(MD5_Digest((unsigned char *) "123456", aaa));
}
