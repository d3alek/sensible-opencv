LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

OPENCVROOT:= /home/d3alek/OpenCV-android-sdk
OPENCV_CAMERA_MODULES:=on
OPENCV_INSTALL_MODULES:=on
OPENCV_LIB_TYPE:=SHARED

LOCAL_LDLIBS += -llog -landroid

include ${OPENCVROOT}/sdk/native/jni/OpenCV.mk

LOCAL_SRC_FILES := main.cpp
LOCAL_MODULE := hello

include $(BUILD_SHARED_LIBRARY)
