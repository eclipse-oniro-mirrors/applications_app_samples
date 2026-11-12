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

// [Start camera_autoSwitchImport]
import { camera } from '@kit.CameraKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl } from '@kit.AbilityKit';
// [End camera_autoSwitchImport]

// [Start camera_autoSwitchComponent]
@Entry
@Component
struct Index {
  private mXComponentController: XComponentController = new XComponentController();
  private mCameraPosition: camera.CameraPosition = camera.CameraPosition.CAMERA_POSITION_BACK;
  private mXComponentOptions: XComponentOptions = {
    type: XComponentType.SURFACE,
    controller: this.mXComponentController
  }

  async loadXComponent() {
    // 初始化XComponent。
  }

  build() {
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
// [End camera_autoSwitchComponent]

class AutoSwitch {
  // [Start camera_enableAutoDeviceSwitch]
  enableAutoDeviceSwitch(session: camera.PhotoSession) {
    if (session.isAutoDeviceSwitchSupported()) {
      try {
        session.enableAutoDeviceSwitch(true);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`The enableAutoDeviceSwitch call failed, error code: ${err.code}, error message: ${err.message}`);
      }
    }
  }
  // [End camera_enableAutoDeviceSwitch]

  // [Start camera_registerAutoDeviceSwitchStatus]
  callback(err: BusinessError, autoDeviceSwitchStatus: camera.AutoDeviceSwitchStatus): void {
    if (err !== undefined && err.code !== 0) {
      console.error(`Callback Error, errorCode: ${err.code}`);
      return;
    }
    console.info(`isDeviceSwitched: ${autoDeviceSwitchStatus.isDeviceSwitched}, isDeviceCapabilityChanged: ${autoDeviceSwitchStatus.isDeviceCapabilityChanged}`);
  }

  registerAutoDeviceSwitchStatus(photoSession: camera.PhotoSession): void {
    photoSession.on('autoDeviceSwitchStatusChange', this.callback);
  }
  unregisterAutoDeviceSwitchStatus(photoSession: camera.PhotoSession): void {
    photoSession.off('autoDeviceSwitchStatusChange', this.callback);
  }
  // [End camera_registerAutoDeviceSwitchStatus]
}
