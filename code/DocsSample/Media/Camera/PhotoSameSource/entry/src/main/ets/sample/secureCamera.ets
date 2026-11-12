/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start camera_secureCameraImport]
import { camera } from '@kit.CameraKit';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [End camera_secureCameraImport]

class SecureCamera {
  // [Start camera_isSecureCamera]
  isSecureCamera(cameraManager: camera.CameraManager, cameraDevice: camera.CameraDevice): boolean {
    let sceneModes: camera.SceneMode[] = cameraManager.getSupportedSceneModes(cameraDevice);
    const secureMode = sceneModes.find(mode => mode === camera.SceneMode.SECURE_PHOTO);
    if (secureMode) {
      console.info(`current device support secure camera!`);
      return true;
    } else {
      console.info(`current device not support secure camera!`);
      return false;
    }
  }

  getSecureCamera(cameraManager: camera.CameraManager): camera.CameraDevice | undefined {
    let cameraArray: camera.CameraDevice[] = cameraManager.getSupportedCameras();
    for (let index = 0; index < cameraArray.length; index++) {
      if (this.isSecureCamera(cameraManager, cameraArray[index])) {
        return cameraArray[index];
      }
    }
    return undefined;
  }
  // [End camera_isSecureCamera]

  // [Start camera_getSupportedOutputCapability]
  getSupportedOutputCapability(cameraManager: camera.CameraManager, secureCamera: camera.CameraDevice): void {
    let outputCap: camera.CameraOutputCapability =
      cameraManager.getSupportedOutputCapability(secureCamera, camera.SceneMode.SECURE_PHOTO);
    let previewProfilesArray: camera.Profile[] = outputCap.previewProfiles;
  }
  // [End camera_getSupportedOutputCapability]

  // [Start camera_createInputAndOutputs]
  async createInputAndOutputs(cameraManager: camera.CameraManager,
    secureCamera: camera.CameraDevice,
    previewProfile: camera.Profile,
    previewSurfaceId: string): Promise<void> {
    // 创建输入流。
    let cameraInput: camera.CameraInput = cameraManager.createCameraInput(secureCamera);
    // 创建普通预览输出流。
    let previewOutput: camera.PreviewOutput = cameraManager.createPreviewOutput(previewProfile, previewSurfaceId);
    // 创建安全数据输出流。
    const receiver: image.ImageReceiver =
      image.createImageReceiver({ width: previewProfile.size.width, height: previewProfile.size.height },
        image.ImageFormat.JPEG, 8);
    const secureSurfaceId: string = await receiver.getReceivingSurfaceId();
    let secureOutput: camera.PreviewOutput = cameraManager.createPreviewOutput(previewProfile, secureSurfaceId);
  }
  // [End camera_createInputAndOutputs]

  // [Start camera_openCamera]
  async openCamera(cameraInput: camera.CameraInput) {
    const seqId: bigint = await cameraInput.open(true);
  }
  // [End camera_openCamera]

  // [Start camera_openSession]
  async openSession(cameraManager: camera.CameraManager,
    cameraInput: camera.CameraInput,
    previewOutput: camera.PreviewOutput,
    secureOutput: camera.PreviewOutput): Promise<void> {
    try {
      let secureSession: camera.SecureSession = cameraManager.createSession(camera.SceneMode.SECURE_PHOTO);
      if (secureSession === undefined) {
        console.error(`create secureSession failed!`);
        return;
      }
      secureSession.beginConfig();
      secureSession.addInput(cameraInput);
      secureSession.addOutput(previewOutput);
      secureSession.addOutput(secureOutput);
      secureSession.addSecureOutput(secureOutput); // 把secureOutput标记成安全输出。
      await secureSession.commitConfig();
      await secureSession.start();
    } catch (err) {
      console.error(`openSession failed!`);
    }
  }
  // [End camera_openSession]

  // [Start camera_onBuffer]
  onBuffer(receiver: image.ImageReceiver): void {
    receiver.on('imageArrival', () => {
      // 从ImageReceiver读取下一张图片。
      receiver.readNextImage()
        .then((img: image.Image) => {
          // 从图像中获取组件缓存。
          return img.getComponent(image.ComponentType.JPEG)
            .then((component: image.Component) => {
              // 安全数据流内容，应用通过解析该buffer内容完成签名认证。
              const buffer = component.byteBuffer;
              console.info(`Succeeded in getting component byteBuffer, size: ${buffer.byteLength}.`);
            })
            .catch((error: BusinessError) => {
              console.error(`getComponent failed, err code: ${error.code}.`);
            })
            .finally(async () => {
              await img.release();
            });
        })
        .catch((error: BusinessError) => {
          console.error(`readNextImage failed, err code: ${error.code}.`);
        });
    });
  }
  // [End camera_onBuffer]
}
