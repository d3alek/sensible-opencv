#include "jni.h"
#include "primalpond_com_structurefrommotion_MainActivity.h"

JNIEXPORT jstring JNICALL Java_primalpond_com_structurefrommotion_MainActivity_hello
  (JNIEnv * env, jobject obj){
    return (*env)->NewStringUTF(env, "Hello from JNI. This is Alek");
  }