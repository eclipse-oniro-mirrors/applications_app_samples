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

// [Start camera_workerImport]
import { BusinessError } from '@kit.BasicServicesKit';
import { camera } from '@kit.CameraKit';
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
// [End camera_workerImport]

// [Start camera_cameraService]
class CameraService {
  private imageWidth: number = 1920;
  private imageHeight: number = 1080;
  private cameraManager: camera.CameraManager | undefined = undefined;
  private cameras: camera.CameraDevice[] = [];
  private cameraInput: camera.CameraInput | undefined = undefined;
  private previewOutput: camera.PreviewOutput | undefined = undefined;
  private photoOutput: camera.PhotoOutput | undefined = undefined;
  private session: camera.PhotoSession | camera.VideoSession | undefined = undefined;

  // 初始化相机。
  async initCamera(context: Context, surfaceId: string): Promise<void> {
    console.info(`initCamera surfaceId: ${surfaceId}`);
    try {
      await this.releaseCamera();
      // 获取相机管理器实例。
      this.cameraManager = camera.getCameraManager(context);
      if (this.cameraManager === undefined) {
        console.error(`cameraManager is undefined`);
        return;
      }
      this.cameras = this.cameraManager.getSupportedCameras();
      if (!this.cameras || this.cameras.length <= 0) {
        console.error(`cameraManager.getSupportedCameras error`);
        return;
      }
      // 创建cameraInput对象。
      this.cameraInput = this.cameraManager.createCameraInput(this.cameras[0]);
      if (this.cameraInput === undefined) {
        console.error(`Failed to create the camera input.`);
        return;
      }
      // 打开相机。
      await this.cameraInput.open();

      let previewProfile: camera.Profile = {
        format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
        size: {
          width: this.imageWidth,
          height: this.imageHeight
        }
      };
      // 创建预览流输出。
      this.previewOutput = this.cameraManager.createPreviewOutput(previewProfile, surfaceId);
      if (this.previewOutput === undefined) {
        console.error(`Failed to create the preview stream.`);
        this.releaseCamera();
        return;
      }

      let photoProfile: camera.Profile = {
        format: camera.CameraFormat.CAMERA_FORMAT_JPEG,
        size: {
          width: this.imageWidth,
          height: this.imageHeight
        }
      };
      // 创建拍照流输出。
      this.photoOutput = this.cameraManager.createPhotoOutput(photoProfile);
      if (this.photoOutput === undefined) {
        console.error(`Failed to create the photoOutput.`);
        this.releaseCamera();
        return;
      }

      // 创建相机会话，启动会话。
      let session = this.cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
      if (!session) {
        console.error(`session is null`);
        this.releaseCamera();
        return;
      }
      this.session = session as camera.PhotoSession;
      this.session.beginConfig();
      this.session.addInput(this.cameraInput);
      this.session.addOutput(this.previewOutput);
      this.session.addOutput(this.photoOutput);
      await this.session.commitConfig();
      await this.session.start();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`initCamera fail: ${err}`);
      this.releaseCamera();
    }
  }

  // 释放相机资源。
  async releaseCamera(): Promise<void> {
    console.info(`releaseCamera is called`);
    // 停止当前会话。
    await this.session?.stop().catch((e: BusinessError) => {console.error(`Failed to stop session:`, e)});
    // 释放相机输入流。
    await this.cameraInput?.close().catch((e: BusinessError) => {console.error(`Failed to close the camera:`, e)});
    // 释放预览输出流。
    await this.previewOutput?.release().catch((e: BusinessError) => {console.error(`Failed to stop the preview stream:`, e)});
    // 释放拍照输出流。
    await this.photoOutput?.release().catch((e: BusinessError) => {console.error(`Stop Photo Stream Failure:`, e)});
    // 释放会话。
    await this.session?.release().catch((e: BusinessError) => {console.error(`Failed to release session:`, e)});
    console.info(`releaseCamera success`);
  }
}
// [End camera_cameraService]

// [Start camera_worker]
let cameraService = new CameraService();
const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

// 自定义消息格式。
interface MessageInfo {
  hasResolve: boolean;
  type: string;
  context: Context; // 注意worker线程中无法使用getContext()直接获取宿主线程context，需要通过消息从宿主线程通信到worker线程使用。
  surfaceId: string;
}

workerPort.onmessage = async (e: MessageEvents) => {
  const messageInfo: MessageInfo = e.data;
  console.info(`worker onmessage type:${messageInfo.type}`)
  if ('initCamera' === messageInfo.type) {
    // 在worker线程中收到宿主线程初始化相机的消息。
    console.info(`worker initCamera surfaceId:${messageInfo.surfaceId}`)
    // 在worker线程中初始化相机。
    await cameraService.initCamera(messageInfo.context, messageInfo.surfaceId);
  } else if ('releaseCamera' === messageInfo.type) {
    // 在worker线程中收到宿主线程释放相机的消息。
    console.info(`worker releaseCamera.`);
    // 在worker线程中释放相机。
    await cameraService.releaseCamera();
  }
}

workerPort.onmessageerror = (error: MessageEvents) => {
  console.error(`messageError, error: ${error}.`);
}

workerPort.onerror = (error: ErrorEvent) => {
  console.error(`onError error: ${error}.`);
}
// [End camera_worker]

// [Start camera_init]
@Entry
@Component
struct Index {
  private mXComponentController: XComponentController = new XComponentController();
  private surfaceId: string = '';
  @State imageWidth: number = 1920;
  @State imageHeight: number = 1080;
  // 创建ThreadWorker对象获取worker实例。
  private workerInstance: worker.ThreadWorker = new worker.ThreadWorker('entry/ets/sample/cameraByWorker.ets');
  private uiContext: UIContext = this.getUIContext();
  private context: Context | undefined = this.uiContext.getHostContext();
  private mXComponentOptions: XComponentOptions = {
    type: XComponentType.SURFACE,
    controller: this.mXComponentController
  }

  onPageShow(): void {
    if ('' !== this.surfaceId) {
      // 通过worker实例向worker线程发送消息初始化相机。
      this.workerInstance.postMessage({
        type: 'initCamera',
        context: this.context,
        surfaceId: this.surfaceId,
      })
    }
  }

  onPageHide(): void {
    // 通过worker实例向worker线程发送消息销毁相机。
    this.workerInstance.postMessage({
      type: 'releaseCamera',
    })
  }

  build() {
    Column() {
      Column() {
        XComponent(this.mXComponentOptions)
          .onLoad(async () => {
            console.info(`onLoad is called`);
            // 初始化XComponent获取预览流surfaceId。
            this.surfaceId = this.mXComponentController.getXComponentSurfaceId();
            let surfaceRect: SurfaceRect = {
              surfaceWidth: this.imageHeight,
              surfaceHeight: this.imageWidth
            };
            this.mXComponentController.setXComponentSurfaceRect(surfaceRect);
            console.info(`onLoad surfaceId: ${this.surfaceId}`);
            if (!this.workerInstance) {
              console.error(`create stage worker failed`);
              return;
            }
            // 宿主线程向worker线程发送初始化相机消息。
            this.workerInstance.postMessage({
              type: 'initCamera',
              context: this.context, // 将宿主线程的context传给worker线程使用。
              surfaceId: this.surfaceId, // 将surfaceId传给worker线程使用。
            })
          })// The width and height of the surface are opposite to those of the XComponent.
          .width(this.uiContext.px2vp(this.imageHeight))
          .height(this.uiContext.px2vp(this.imageWidth))

      }.justifyContent(FlexAlign.Center)
      .height('90%')

      Text('WorkerDemo')
        .fontSize(36)
    }
    .justifyContent(FlexAlign.End)
    .height('100%')
    .width('100%')
  }
}
// [End camera_init]
