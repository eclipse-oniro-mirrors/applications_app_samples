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

// [Start input_case_input_create_not_focusable_subwindow]
// NotFocusableWindowDemo.ets实现主窗的布局内容
import {
  Entry,
  Component,
  Flex,
  Text,
  TextInput,
  Button,
  FlexOptions,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  window,
  AppStorage,
  $r
} from '@kit.ArkUI';
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';
import Log from '../model/Log';

const TAG: string = 'NotFocusableWindowDemo->';

@Entry
@Component
struct NotFocusableWindowDemo {
  private subWindow: window.Window | null = null;

  async createSubWindow(): Promise<void> {
    try {
      if (this.subWindow !== null) {
        await this.subWindow!.showWindow();
        return;
      }
      let windowStage: window.WindowStage | undefined = AppStorage.get<window.WindowStage>('windowStage');
      if (windowStage === undefined) {
        Log.showError(TAG, 'Failed to get windowStage');
        return;
      }
      let title: string | undefined =
        this.getUIContext().getHostContext()?.resourceManager.getStringSync($r('app.string.subwindow_title').id);
      let options: window.SubWindowOptions = { title: title ? title : '', decorEnabled: true };
      let subWindow: window.Window = await windowStage.createSubWindowWithOptions('mySubWindow', options);
      this.subWindow = subWindow;
      const subWindowId: number = subWindow.getWindowProperties().id;
      AppStorage.setOrCreate('subWindowId', subWindowId);
      await subWindow.resize(500, 500);
      await subWindow.setUIContent('pages/SubWindowIndex');
      await subWindow.setWindowFocusable(false);
      await subWindow.showWindow();
      Log.showInfo(TAG, 'Succeeded in creating and showing the subWindow.');
    } catch (exception) {
      let error: BusinessError = exception as BusinessError;
      Log.showError(TAG, `Failed to create the subWindow. Cause code: ${error.code}, message: ${error.message}`);
    }
  }

  async destroySubWindow(): Promise<void> {
    try {
      if (this.subWindow === null) {
        return;
      }
      await this.subWindow!.destroyWindow();
      this.subWindow = null;
      Log.showInfo(TAG, 'Succeeded in destroying the subWindow.');
    } catch (exception) {
      let error: BusinessError = exception as BusinessError;
      Log.showError(TAG, `Failed to destroy the subWindow. Cause code: ${error.code}, message: ${error.message}`);
    }
  }

  aboutToDisappear(): void {
    this.destroySubWindow();
  }

  build(): void {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    } as FlexOptions) {
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
