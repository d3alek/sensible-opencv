LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

OPENCVROOT:= /home/d3alek/OpenCV-android-sdk-3.10
OPENCV_CAMERA_MODULES:=on
OPENCV_INSTALL_MODULES:=on
OPENCV_LIB_TYPE:=SHARED

LOCAL_LDLIBS += -llog -landroid

include ${OPENCVROOT}/sdk/native/jni/OpenCV.mk

FILE_LIST := $(wildcard $(LOCAL_PATH)/*.cpp)
LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)

LOCAL_MODULE := sensible

include $(BUILD_SHARED_LIBRARY)
