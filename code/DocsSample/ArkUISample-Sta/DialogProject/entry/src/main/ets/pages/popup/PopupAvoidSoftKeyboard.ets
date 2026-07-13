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

// [Start avoidSoftKeyboard_popup]
// xxx.ets
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Button,
  Text,
  TextInput,
  NavDestination,
  Builder,
  Placement,
  KeyboardAvoidMode,
  CustomPopupOptions,
  $r
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
export struct AvoidSoftKeyboardPopupExample {
  @State handlePopup: boolean = false;

  @Builder
  popupBuilder(): void {
    Column({ space: 2 } as ColumnOptions) {
      Text('Custom Popup').fontSize(20)
        .borderWidth(2)
      TextInput()
    }.width(200).padding(5)
  }

  build(): void {
    NavDestination() {
      Column({ space: 100 } as ColumnOptions) {
        TextInput()
        Button('PopupOptions')
          .id('PopupOptions')
          .onClick((): void => {
            this.handlePopup = !this.handlePopup;
          })
          .bindPopup(this.handlePopup!!, {
            width: 200,
            builder: this.popupBuilder,
            placement: Placement.Bottom,
            mask: false,
            autoCancel: false,
            keyboardAvoidMode: KeyboardAvoidMode.DEFAULT
          } as CustomPopupOptions)
          .position({ x: 100, y: 300 })
      }
      .width('100%')
    }
    // [StartExclude avoidSoftKeyboard_popup]
    // 请将$r('app.string.AvoidSoftKeyboardPopupExample_title')替换为实际资源文件，在本示例中该资源文件的value值为"气泡避让软键盘"
    .title($r('app.string.AvoidSoftKeyboardPopupExample_title'))
    // [EndExclude avoidSoftKeyboard_popup]
  }
}
// [End avoidSoftKeyboard_popup]