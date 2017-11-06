# Sensible OpenCV
Android Studio project demonstrating OpenCV Java and C++ harmony

Tested with Android studio 3.0.0 and OpenCV 3.3.1

Out of the box you get:
- Live preview from the Android device's camera orchestrated using Android activity callbacks and Java
- Text stamped on the image from native code using Android NDK and OpenCV C++.

Other features:
- Taking into account orientation changes (thank you [Zarokka](http://answers.opencv.org/question/7313/rotating-android-camera-to-portrait/?answer=29866#post-id-29866)).
Without this, the OpenCV viewer will always orient the images horizontally.
- Building OpenCV with CMake, for easy integration with other CMake projects

## Requirements

You need the [OpenCV Android SDK](https://sourceforge.net/projects/opencvlibrary/files/opencv-android/)
 downloaded on your machine to compile the app.

## How to compile

Clone this project and open it in Android Studio. Edit the gradle.properties file and set the OpenCVAndroidSDK variable to the full path to OpenCV Android SDK you downloaded on your system. Compile, run and enjoy the working Android, OpenCV Java and OpenCV C++ integration.

## How to use
Add your C++ files to src/main/cpp and Header files to src/main/cpp/include. Edit app/CMakeLists.txt, adding a line for your library before target_link_libraries like so:
    add_library(library-name SHARED src/main/cpp/library-source.cpp)

Make sure the following line appears in the app/CMakeLists.txt file, otherwise your header files will not be found.
    include_directories(src/main/cpp/include)

Finally, add your library to the target_link_libraries clause:
    target_link_libraries(library-name ${OpenCV_LIBS})

If you wish to call a C++ method from Java, define the native method in java (public native void methodName(java arguments)) and then:
- use the javah tool (for Android Studio integration see Step 4 in [HujiaweiBujidao](http://hujiaweibujidao.github.io/blog/2014/10/22/android-ndk-and-opencv-development-with-android-studio)'s blog)
on the java file which will generate a nice header file in the jni directory ([here](app/src/main/jni/primalpond_com_sensibleopencv_MainActivity.h) is an example for such a file)
- OR determine the C++ method name by yourself by combining the package, activity and method name

For passing Mat objects around I use native addresses. See how MainActivity calls putText and how putText.cpp manipulates the Mat.

## Issues with orientation
Seems like different phones (and Android implementations) rotate camera images differently. Current code is tested on Moto E 2 4G. 

If your phone is having orientation issues, let me know. To fix it yourself, MainActivity::onCameraFrame has commented code to fix orientation when phone is horizontal, and PortraitCameraView.JavaCameraFrame::gray and rgba do the appropriate rotations when phone is vertical.

## Motivation

I call it 'sensible' because I expected all these features from the OpenCV Android SDK. This project puts you on a solid ground to develop your Android vision ideas. Hope to save you the long hours I spent on getting the integration working. 

## Update to newer OpenCV SDK

Updating OpenCV Android SDK involves:
- using Andruid Studio's File > New > Import Module on NEWER-OPENCV-ANDROID-SDK/sdk/java
- this will create sensible-opencv/openCVLibraryXXX module (where XXX is the version)
