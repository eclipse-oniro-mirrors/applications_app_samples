#  AVRecorder

###  Introduction

In this sample, you can use AVRecorder interfaces to record audio or video. It provides both ArkTS and C(NDK) interfaces for recording.

### Required Permissions

ohos.permission.MICROPHONE, which request the permission of microphone.

ohos.permission.CAMERA, which request the permission of camera.

ohos.permission.WRITE_MEDIA, which allows an app to write media files to the user's external storage.

### Usage

**ArkTS Interface:**

1. On the home page, you can either choose **Video Recording** or **Audio Recording** button according to your purpose.
2. Click the **Video Recording** button to switch to the video recording page.  You can click the setting button to choose video resolution. Click the start, pause, resume, stop button to control the recording process.
3. Click the **Audio Recording** button to switch to the audio recording page. You can click the setting button to choose audio sample rate. Click the start, pause, resume, stop button to control the recording process.

**C(NDK) Interface:**

4. Click the **VideoRecorder(NDK)** button to switch to the NDK video recording page. Click the start, pause, resume, stop button to control the recording process.
5. Click the **AudioRecorder(NDK)** button to switch to the NDK audio recording page. Click the start, pause, resume, stop button to control the recording process.

6. The files you have recorded can be found in Photos.

### Constraints

1. This sample can only be run on standard-system devices that use the phone.
2. This sample is based on the stage model, which is supported from API version 12. You should manully fetch Full SDK from gitcode and replace them in DevEco Studio.
3. This sample recommends you to use the latest version of DevEco Studio.
4. Camera apis can only be used by system app. In order to run this sample, you should generate signature manually with hap-sign-tool.
