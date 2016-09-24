LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

OPENCV_CAMERA_MODULES:=on
OPENCV_INSTALL_MODULES:=on
OPENCV_LIB_TYPE:=SHARED

LOCAL_LDLIBS += -llog -landroid

OPENCVMAKE:= ${LOCAL_PATH}/../../../../OpenCV-3.1.0-android-sdk/sdk/native/jni/OpenCV.mk
include ${OPENCVMAKE}

FILE_LIST := $(wildcard $(LOCAL_PATH)/*.cpp)
LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)

LOCAL_MODULE := sensible

include $(BUILD_SHARED_LIBRARY)
