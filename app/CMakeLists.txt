cmake_minimum_required(VERSION 3.4.1)

set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11")

#set(OPENCV_ANDROID_SDK /home/alek/Downloads/OpenCV-android-sdk)

set(OpenCV_DIR ${OPENCV_ANDROID_SDK}/sdk/native/jni)
find_package (OpenCV REQUIRED)

add_library( putText SHARED src/main/cpp/putText.cpp )
include_directories(src/main/cpp/include)

target_link_libraries(putText ${OpenCV_LIBS})