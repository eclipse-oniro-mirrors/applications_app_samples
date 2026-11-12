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

// [Start camera_autoSwitchPage]
import { camera } from '@kit.CameraKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, PermissionRequestResult } from '@kit.AbilityKit';

const TAG = 'AutoSwitchCameraDemo ';

@Entry
@Component
struct Index {
  @State isShow: boolean = false;
  @State reloadXComponentFlag: boolean = false;
  private mXComponentController: XComponentController = new XComponentController();
  private mXComponentOptions: XComponentOptions = {
    type: XComponentType.SURFACE,
    controller: this.mXComponentController
  }
  private mSurfaceId: string = '';
  private mCameraPosition: camera.CameraPosition = camera.CameraPosition.CAMERA_POSITION_BACK;
  private mCameraManager: camera.CameraManager | undefined = undefined;
  private curCameraDevice: camera.CameraDevice | undefined = undefined;
  private mCameraInput: camera.CameraInput | undefined = undefined;
  private mPreviewOutput: camera.PreviewOutput | undefined = undefined;
  private mPhotoSession: camera.PhotoSession | undefined = undefined;
  // One of the recommended preview resolutions.
  private previewProfileObj: camera.Profile = {
    format: 1003,
    size: {
      width: 1920,
      height: 1080
    }
  };
  private mContext: Context | undefined = undefined;
  autoDeviceSwitchCallback: (err: BusinessError, autoDeviceSwitchStatus: camera.AutoDeviceSwitchStatus) => void =
    (err: BusinessError, autoDeviceSwitchStatus: camera.AutoDeviceSwitchStatus) => {
      if (err !== undefined && err.code !== 0) {
        console.error(`${TAG} Callback Error, errorCode: ${err.code}`);
        return;
      }
      console.info(`${TAG} isDeviceSwitched: ${autoDeviceSwitchStatus.isDeviceSwitched}, isDeviceCapabilityChanged: ${autoDeviceSwitchStatus.isDeviceCapabilityChanged}`);
    }

  requestPermissionsFn(): void {
    let atManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(this.mContext, ['ohos.permission.CAMERA'])
      .then((result: PermissionRequestResult): void => {
        if (result.authResults[0] === 0) {
          this.isShow = true;
        } else {
          console.error(`${TAG}ohos.permission.CAMERA is denied by the user.`);
        }
      }).catch((error: BusinessError): void => {
        console.error(`${TAG}ohos.permission.CAMERA no permission, error: ${error.code}`);
      });
  }

  initContext(): void {
    let uiContext = this.getUIContext();
    this.mContext = uiContext.getHostContext();
  }

  initCameraManager(): void {
    try {
      this.mCameraManager = camera.getCameraManager(this.mContext);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`getCameraManager failed, error: ${err.code}`);
    }
  }

  aboutToAppear(): void {
    console.info(`${TAG}aboutToAppear is called`);
    this.initContext();
    this.requestPermissionsFn();
    this.initCameraManager();
  }

  async aboutToDisappear(): Promise<void> {
    await this.releaseCamera();
  }

  async onPageShow(): Promise<void> {
    if (this.mSurfaceId === '') {
      console.error(`${TAG}the surfaceId is empty, wait for the XComponent to be loaded.`);
      return;
    }
    await this.initCamera(this.mSurfaceId, this.mCameraPosition);
  }

  async releaseCamera(): Promise<void> {
    // 停止当前会话。
    try {
      await this.mPhotoSession?.stop();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to stop session, errorCode = ${err.code}`);
    }

    // 释放相机输入流。
    try {
      await this.mCameraInput?.close();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to close device, errorCode = ${err.code}`);
    }

    // 释放预览输出流。
    try {
      await this.mPreviewOutput?.release();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to release previewOutput, errorCode = ${err.code}`);
    }

    this.mPreviewOutput = undefined;

    // 释放会话。
    try {
      await this.mPhotoSession?.release();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to release photoSession, errorCode = ${err.code}`);
    }

    // 会话置空。
    this.mPhotoSession = undefined;
  }

  async loadXComponent(): Promise<void> {
    this.mSurfaceId = this.mXComponentController.getXComponentSurfaceId();
    console.info(TAG + `mCameraPosition: ${this.mCameraPosition}`)
    await this.initCamera(this.mSurfaceId, this.mCameraPosition);
  }

  getPreviewProfile(cameraOutputCapability: camera.CameraOutputCapability): camera.Profile | undefined {
    let previewProfiles = cameraOutputCapability.previewProfiles;
    if (previewProfiles.length < 1) {
      return undefined;
    }
    let index = previewProfiles.findIndex((previewProfile: camera.Profile) => {
      return previewProfile.size.width === this.previewProfileObj.size.width &&
        previewProfile.size.height === this.previewProfileObj.size.height &&
        previewProfile.format === this.previewProfileObj.format;
    })
    if (index === -1) {
      return undefined;
    }
    return previewProfiles[index];
  }

  async initCamera(surfaceId: string, cameraPosition: camera.CameraPosition,
    connectionType: camera.ConnectionType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN): Promise<void> {
    await this.releaseCamera();
    // 创建CameraManager对象。
    if (!this.mCameraManager) {
      console.error(`${TAG}camera.getCameraManager error`);
      return;
    }

    // 获取相机列表。
    let cameraArray: camera.CameraDevice[] = this.mCameraManager.getSupportedCameras();
    if (cameraArray.length <= 0) {
      console.error(`${TAG}cameraManager.getSupportedCameras error`);
      return;
    }

    for (let index = 0; index < cameraArray.length; index++) {
      console.info(`${TAG}cameraId : ${cameraArray[index].cameraId}`); // 获取相机ID。
      console.info(`${TAG}cameraPosition : ${cameraArray[index].cameraPosition}`); // 获取相机位置。
      console.info(`${TAG}cameraType : ${cameraArray[index].cameraType}`); // 获取相机类型。
      console.info(`${TAG}connectionType : ${cameraArray[index].connectionType}`); // 获取相机连接类型。
    }

    let deviceIndex = cameraArray.findIndex((cameraDevice: camera.CameraDevice) => {
      return cameraDevice.cameraPosition === cameraPosition && cameraDevice.connectionType === connectionType;
    })
    // 没有找到对应位置的摄像头，可选择其他摄像头，具体场景具体对待。
    if (deviceIndex === -1) {
      deviceIndex = 0;
      console.error(`${TAG}not found camera`);
    }
    this.curCameraDevice = cameraArray[deviceIndex];

    // 创建相机输入流。
    try {
      this.mCameraInput = this.mCameraManager.createCameraInput(this.curCameraDevice);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to createCameraInput errorCode = ${err.code}`);
    }
    if (this.mCameraInput === undefined) {
      return;
    }

    // 打开相机。
    try {
      await this.mCameraInput.open();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to open device, errorCode = ${err.code}`);
    }

    // 获取支持的模式类型。
    let sceneModes: camera.SceneMode[] = this.mCameraManager.getSupportedSceneModes(this.curCameraDevice);
    let isSupportPhotoMode: boolean = sceneModes.indexOf(camera.SceneMode.NORMAL_PHOTO) >= 0;
    if (!isSupportPhotoMode) {
      console.error(`${TAG}photo mode not support`);
      return;
    }

    // 获取相机设备支持的输出流能力。
    let cameraOutputCapability: camera.CameraOutputCapability =
      this.mCameraManager.getSupportedOutputCapability(this.curCameraDevice, camera.SceneMode.NORMAL_PHOTO);
    if (!cameraOutputCapability) {
      console.error(`${TAG}cameraManager.getSupportedOutputCapability error`);
      return;
    }
    console.info(`${TAG}outputCapability: ${JSON.stringify(cameraOutputCapability)}`);
    let previewProfile = this.getPreviewProfile(cameraOutputCapability);
    if (previewProfile === undefined) {
      console.error(`${TAG}The resolution of the current preview stream is not supported.`);
      return;
    }
    this.previewProfileObj = previewProfile;

    // 创建预览输出流，其中参数 surfaceId 参考上文 XComponent 组件，预览流为 XComponent 组件提供的 surface。
    try {
      this.mPreviewOutput = this.mCameraManager.createPreviewOutput(this.previewProfileObj, surfaceId);
    } catch (error) {
      let err = error as BusinessError;
      console.error(TAG + `Failed to create the PreviewOutput instance. error code: ${err.code}`);
    }
    if (this.mPreviewOutput === undefined) {
      return;
    }

    // 创建会话。
    try {
      this.mPhotoSession = this.mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to create the session instance. errorCode = ${err.code}`);
    }
    if (this.mPhotoSession === undefined) {
      return;
    }
    if (this.mPhotoSession.isAutoDeviceSwitchSupported()) {
      this.mPhotoSession.enableAutoDeviceSwitch(true);
      this.mPhotoSession.on('autoDeviceSwitchStatusChange', this.autoDeviceSwitchCallback);
    }
    // 开始配置会话。
    try {
      this.mPhotoSession.beginConfig();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to beginConfig. errorCode = ${err.code}`);
    }

    // 向会话中添加相机输入流。
    try {
      this.mPhotoSession.addInput(this.mCameraInput);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to addInput. errorCode = ${err.code}`);
    }

    // 向会话中添加预览输出流。
    try {
      this.mPhotoSession.addOutput(this.mPreviewOutput);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to addOutput(previewOutput). errorCode = ${err.code}`);
    }

    // 提交会话配置。
    try {
      await this.mPhotoSession.commitConfig();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to commit session configuration, errorCode = ${err.code}`);
    }

    // 启动会话。
    try {
      await this.mPhotoSession.start()
    } catch (error) {
      let err = error as BusinessError;
      console.error(`${TAG}Failed to start session. errorCode = ${err.code}`);
    }
  }

  build() {
    if (this.isShow) {
      Stack() {
        XComponent(this.mXComponentOptions)
          .onLoad(async () => {
            await this.loadXComponent();
          })
          .width(this.getUIContext().px2vp(1080))
          .height(this.getUIContext().px2vp(1920))
        Text($r('app.string.switch_camera'))
          .size({ width: 80, height: 48 })
          .position({ x: 1, y: 1 })
          .backgroundColor(Color.White)
          .textAlign(TextAlign.Center)
          .borderRadius(24)
          .onClick(async () => {
            this.mCameraPosition = this.mCameraPosition === camera.CameraPosition.CAMERA_POSITION_BACK ?
              camera.CameraPosition.CAMERA_POSITION_FRONT : camera.CameraPosition.CAMERA_POSITION_BACK;
            await this.loadXComponent();
          })
      }
      .size({ width: '100%', height: '100%' })
      .backgroundColor(Color.Black)
    }
  }
}
// [End camera_autoSwitchPage]
