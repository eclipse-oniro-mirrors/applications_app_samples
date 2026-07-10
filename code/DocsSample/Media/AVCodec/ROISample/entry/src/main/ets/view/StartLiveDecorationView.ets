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
import { camera } from '@kit.CameraKit';
import { CameraController } from '../controller/CameraController';
import { BgmController } from '../controller/BgmController';
import { CommonConstants } from '../common/CommonConstants';
import Logger from '../common/utils/Logger';

const TAG: string = '[Sample_HMOSLiveStream]';

@Component
export struct StartLiveDecorationView {
  @Consume('pageStack') pageStack: NavPathStack;
  @Consume('cameraController') cameraController: CameraController;
  @Consume('bgmController') bgmController: BgmController;
  @Consume('fileNameSandbox') fileNameSandbox: string;
  @StorageLink(CommonConstants.KEY_PREFIX + 'currentWidthBreakpoint') currentWidthBreakpoint: string = 'md';
  @State fov: number = 1;
  @State currentFovToShow: number = 1.0;
  @State isCurrentFovOnShow: boolean = false;
  @State isTablet: boolean = false;

  @Builder
  FocusText() {
    if (this.isCurrentFovOnShow) {
      Text(this.currentFovToShow.toFixed(1) + 'x')
        .fontSize(20)
        .fontColor(Color.White);
    }
  }

  @Builder
  BottomBar() {
    Row() {
      Image($r('app.media.toggle_position'))
        .width('48vp')
        .height('48vp')
        .onClick(() => {
          // Camera rotation / switching between front and rear cameras
          let cameraPosition = this.cameraController.getCameraPosition()
          if (cameraPosition === camera.CameraPosition.CAMERA_POSITION_FRONT) {
            cameraPosition = camera.CameraPosition.CAMERA_POSITION_BACK;
          } else {
            cameraPosition = camera.CameraPosition.CAMERA_POSITION_FRONT;
          }
          this.cameraController.setCameraPosition(cameraPosition);
          this.cameraController.releaseCamera();
          this.cameraController.createRecorder();
        })
    }
    .position({
      bottom: this.isTablet ? null : '32vp'
    })
    .width('100%')
    .padding({
      left: '24vp',
      right: this.isTablet ? '56vp' : '24vp'
    })
    .justifyContent(this.isTablet ? FlexAlign.End : FlexAlign.Center);
  }

  aboutToAppear(): void {
    this.isTablet = this.currentWidthBreakpoint === 'lg' || this.currentWidthBreakpoint === 'xl';
  }

  build() {
    Stack() {
      this.FocusText();
      this.BottomBar();
    }
    .width('100%')
    .height('100%')
    .gesture(
      PinchGesture()
        .onActionUpdate((event: GestureEvent) => {
          Logger.debug(TAG, 'begin action update.');
          this.isCurrentFovOnShow = true;
          this.cameraController.doGestureUpdate(this.fov, event);
          let curFov = this.cameraController.getCurrentZoomRatio();
          if (curFov) {
            this.currentFovToShow = curFov;
          }
        })
        .onActionEnd((_: GestureEvent) => {
          Logger.debug(TAG, 'action End ');
          let curFov = this.cameraController.getCurrentZoomRatio();
          if (curFov) {
            this.fov = curFov;
          }
          this.isCurrentFovOnShow = false;
        })
    )
  }
}