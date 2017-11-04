# Sensible OpenCV
Android Studio project demonstrating OpenCV Java and C++ harmony

Tested with Android studio 3.0.0 and OpenCV 3.3.1

Out of the box you get:
- Live preview from the Android device's camera orchestrated using Android activity callbacks and Java
- Text stamped on the image from native code using Android NDK and OpenCV C++.

Other features:
- Taking into account orientation changes (thank you [Zarokka](http://answers.opencv.org/question/7313/rotating-android-camera-to-portrait/?answer=29866#post-id-29866)).
Without this, the OpenCV viewer will always orient the images horizontally.
- Automatically pack all C/C++ files from /src/main/jni to module named 'sensible' which is registered in app's build.gradle and MainActivity.java (thank you [DRiFTy](http://stackoverflow.com/a/8980441/5799810)) 

## How to compile

Clone this project and open it in Android Studio. Compile, run and enjoy the working Android, OpenCV Java and OpenCV C++ integration.

## How to use

Change the project name to your preference (for example follow [narko](http://stackoverflow.com/a/38011028/5799810)'s suggestions)

Add your C++ files to src/main/jni and they should be automatically compiled. 
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
- downloading the sdk from [sourceforge](https://sourceforge.net/projects/opencvlibrary/files/opencv-android/)
- putting the unzipped folder inside sensible-opencv root (sensible-opencv/NEWER-OPENCV-SDK) 
- using Andruid Studio's File > New > Import Module on sensible-opencv/NEWER-OPENCV-SDK/sdk/java
- this will create sensible-opencv/openCVLibraryXXX module (where XXX is the version)
- I like to update the compileSdkVersion and minSdkVersion of sensible-opencv/openCVLibraryXXX/build.gradle to those of the main project to skip dowloading older SDKs
- now change local.properties and Android.mk to point to the new version
- delete the old version folders (the *-sdk folder, and the library module)
- you can delete everything but sensible-opencv/NEWER-OPENCV-SDK/sdk/native which we reference in Android.mk
