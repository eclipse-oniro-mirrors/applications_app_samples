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

// SubWindowIndex.ets实现子窗的布局内容
import { window } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import Log from '../model/Log';

const TAG: string = 'SubWindowIndex->';

@Entry
@Component
struct SubWindowIndex {
  // [Start input_case_input_shift_focus_in_not_focusable_window]
  async shiftFocusToSubWindow(): Promise<void> {
    try {
      let windowStage: window.WindowStage | undefined = AppStorage.get<window.WindowStage>('windowStage');
      if (windowStage === undefined) {
        Log.showError(TAG, 'Failed to get the windowStage.');
        return;
      }
      let subWindowList: window.Window[] = await windowStage.getSubWindow();
      let subWindow: window.Window = subWindowList[0];
      // 1.将子窗口设置为可获焦
      await subWindow.setWindowFocusable(true);
      // 2.将焦点切换到子窗口
      const mainWindowId: number = AppStorage.get<number>('mainWindowId') ?? 0;
      const subWindowId: number = AppStorage.get<number>('subWindowId') ?? 0;
      await window.shiftAppWindowFocus(mainWindowId, subWindowId);
      Log.showInfo(TAG, 'Succeeded in shifting focus to subWindow.');
    } catch (exception) {
      const err = exception as BusinessError;
      Log.showError(TAG, `Failed to shift focus to subWindow. Cause code: ${err.code}, message: ${err.message}`);
    }
  }
  // [End input_case_input_shift_focus_in_not_focusable_window]
  // [Start input_case_input_shift_focus_to_main_window]
  async shiftFocusToMainWindow(): Promise<void> {
    try {
      let windowStage: window.WindowStage | undefined = AppStorage.get<window.WindowStage>('windowStage');
      if (windowStage === undefined) {
        Log.showError(TAG, 'Failed to get the windowStage.');
        return;
      }
      let subWindowList: window.Window[] = await windowStage.getSubWindow();
      let subWindow: window.Window = subWindowList[0];
      // 将子窗口设置为不可获焦，true表示允许获取焦点，false表示不允许
      await subWindow.setWindowFocusable(false);
      Log.showInfo(TAG, 'Succeeded in shifting focus to main window.');
    } catch (exception) {
      const err = exception as BusinessError;
      Log.showError(TAG, `Failed to shift focus to main window. Cause code: ${err.code}, message: ${err.message}`);
    }
  }
  // [End input_case_input_shift_focus_to_main_window]
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      TextInput({ placeholder: $r('app.string.subwindow_input_placeholder') })
        .width('90%')
        .height(48)
        .margin(10)
        .onClick(() => {
          // 用户点击子窗的输入组件，切换焦点至子窗
          this.shiftFocusToSubWindow();
        })
      Button('这是一个普通组件')
        .width('90%')
        .height(48)
        .margin(10)
        .onClick(() => {
          // 点击子窗非输入组件时，可切换焦点回主窗口
          this.shiftFocusToMainWindow();
        })
    }
    .width('100%')
    .height('100%')
  }
}
