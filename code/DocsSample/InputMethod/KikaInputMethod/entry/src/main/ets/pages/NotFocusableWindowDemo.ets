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

// [Start input_case_input_create_not_focusable_subwindow]
// NotFocusableWindowDemo.ets实现主窗的布局内容
import { window } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import Log from '../model/Log';

const TAG: string = 'NotFocusableWindowDemo->';

@Entry
@Component
struct NotFocusableWindowDemo {
  private subWindow: window.Window | null = null;

  async createSubWindow(): Promise<void> {
    try {
      // 已创建过子窗时，直接再次显示
      if (this.subWindow !== null) {
        await this.subWindow.showWindow();
        return;
      }
      // 1.创建子窗并设置子窗id
      let windowStage: window.WindowStage | undefined = AppStorage.get<window.WindowStage>('windowStage');
      if (windowStage === undefined) {
        Log.showError(TAG, 'Failed to get windowStage');
        return;
      }
      let title: string | undefined = this.getUIContext().getHostContext()?.resourceManager.getStringSync($r('app.string.subwindow_title').id);
      let options: window.SubWindowOptions = { title: title ? title : '', decorEnabled: true };
      let subWindow: window.Window = await windowStage.createSubWindowWithOptions('mySubWindow', options);
      this.subWindow = subWindow;
      const subWindowId: number = subWindow.getWindowProperties().id;
      AppStorage.setOrCreate('subWindowId', subWindowId);
      // 2.设置子窗为不可获焦，true表示允许获取焦点，false表示不允许
      await subWindow.resize(500, 500);
      await subWindow.setUIContent('pages/SubWindowIndex');
      await subWindow.setWindowFocusable(false);
      // 3.显示子窗
      await subWindow.showWindow();
      Log.showInfo(TAG, 'Succeeded in creating and showing the subWindow.');
    } catch (exception) {
      const err = exception as BusinessError;
      Log.showError(TAG, `Failed to create the subWindow. Cause code: ${err.code}, message: ${err.message}`);
    }
  }

  async destroySubWindow(): Promise<void> {
    try {
      if (this.subWindow === null) {
        return;
      }
      await this.subWindow.destroyWindow();
      this.subWindow = null;
      Log.showInfo(TAG, 'Succeeded in destroying the subWindow.');
    } catch (exception) {
      const err = exception as BusinessError;
      Log.showError(TAG, `Failed to destroy the subWindow. Cause code: ${err.code}, message: ${err.message}`);
    }
  }

  aboutToDisappear(): void {
    // 离开页面时销毁子窗，避免残留
    this.destroySubWindow();
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text($r('app.string.not_focusable_window_title'))
        .fontSize(18)
        .fontWeight(500)
        .margin(20)
      TextInput({ placeholder: $r('app.string.subwindow_placeholder') })
        .width('90%')
        .height(48)
        .margin(10)
        .onClick(() => {
          this.createSubWindow();
        })
      Button($r('app.string.subwindow_destroy'))
        .width('90%')
        .height(48)
        .margin(10)
        .onClick(() => {
          this.destroySubWindow();
        })
    }
    .width('100%')
    .height('100%')
  }
}
// [End input_case_input_create_not_focusable_subwindow]
