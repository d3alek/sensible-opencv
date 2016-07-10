#include "jni.h"
#include "primalpond_com_sensibleopencv_MainActivity.h"
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc.hpp>

using namespace cv;

JNIEXPORT void JNICALL Java_primalpond_com_sensibleopencv_MainActivity_putText
  (JNIEnv * env, jobject obj, jlong imageAddr) {
    Mat* image = (Mat*) imageAddr;
    Point position = Point(100,100);
    Point newLine = Point(0, 50);
    Scalar color = Scalar(255,255,255);

    putText(*image, "Hello SensibleOpenCV.", position, FONT_HERSHEY_PLAIN, 2, color);
    putText(*image, "Andriod OpenCV Java and C++ harmony", position + newLine, FONT_HERSHEY_PLAIN, 2, color);
    return;
   }