#include "jni.h"
#include "primalpond_com_structurefrommotion_MainActivity.h"
#include <opencv2/core/core.hpp>

JNIEXPORT jstring JNICALL Java_primalpond_com_structurefrommotion_MainActivity_hello
  (JNIEnv * env, jobject obj){
    return env->NewStringUTF("Hello from JNI and OpenCV");
  }