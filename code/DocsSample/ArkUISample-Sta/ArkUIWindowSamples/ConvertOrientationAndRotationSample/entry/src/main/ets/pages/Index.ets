'use static'

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

// [Start convert_orientation_rotation]
import { display, window } from '@kit.ArkUI';
import { Entry, Component, Column, Text, Button, ClickEvent, FlexAlign, HorizontalAlign } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct SpecificSceneSetOrientationIndex {
  mainWindow: window.Window = AppStorage.get<window.Window>('mainWindow_SetOrientation') as window.Window;
  setOrientationByDisplay(): void {
    try {
      // 1.获取当前默认Display
      const disp: display.Display = display.getDefaultDisplaySync();
      const displayOrientation: int = disp.orientation as int; // 当前屏幕方向（0/1/2/3）

      console.info('Current display orientation = ' + displayOrientation);
      // 2.将displayOrientation转换为windowOrientation
      let windowOrientation: int =
        this.mainWindow.convertOrientationAndRotation(
          window.RotationInfoType.DISPLAY_ORIENTATION,
          window.RotationInfoType.WINDOW_ORIENTATION,
          displayOrientation
        );
      // 3.根据windowOrientation映射到window.Orientation
      let orientation: window.Orientation = window.Orientation.UNSPECIFIED;

      switch (windowOrientation) {
        case 0:
          orientation = window.Orientation.PORTRAIT;
          break;
        case 1:
          orientation = window.Orientation.LANDSCAPE_INVERTED;
          break;
        case 2:
          orientation = window.Orientation.PORTRAIT_INVERTED;
          break;
        case 3:
          orientation = window.Orientation.LANDSCAPE;
          break;
        default:
          throw new Error('Invalid orientation value');
      }
      // 4.设置旋转策略锁定窗口方向
      this.mainWindow.setPreferredOrientation(orientation, (err: BusinessError<void> | null): void => {
        if (err && err.code) {
          console.error('setPreferredOrientation failed: ' + JSON.stringify(err));
        }
      });
    } catch (exception) {
      let error = exception as BusinessError;
      console.error('Exception in setOrientationByDisplay: ' + JSON.stringify(error));
    }
  }
  build() {
    Column(undefined) {
      Text('Lock the display orientation')
        .fontSize(17)
      Button('Set orientation from display')
        .onClick((event: ClickEvent) => {
          console.info('Click: Set orientation from display');
          this.setOrientationByDisplay();
        })
        .margin({ top: 20 })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}
// [End convert_orientation_rotation]
