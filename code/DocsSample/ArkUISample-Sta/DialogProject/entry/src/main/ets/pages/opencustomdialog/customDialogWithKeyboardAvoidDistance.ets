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

// [Start custom_dialog_with_key_board_distance]
import {
  Entry,
  Component,
  Column,
  Row,
  RowOptions,
  Text,
  TextInput,
  NavDestination,
  Builder,
  DialogAlignment,
  KeyboardAvoidMode,
  LengthMetrics,
  $r
} from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: int = 0x0000;

@Entry
@Component
export struct CustomDialogWithKeyboardAvoidDistance {
  @Builder
  customDialogComponent(): void {
    Column() {
      Text('keyboardAvoidDistance: 0vp')
        .fontSize(20)
        .margin({ bottom: 36 })
      TextInput({ placeholder: '' })
    }.backgroundColor('#FFF0F0F0')
  }

  build(): void {
    NavDestination() {
      Row() {
        Row({ space: 20 } as RowOptions) {
          // 请将$r('app.string.open_windows')替换为实际资源文件,在本示例中该资源文件的value值为"打开弹窗"
          Text($r('app.string.open_windows'))
            .fontSize(30)
            .onClick((): void => {
              this.getUIContext().getPromptAction().openCustomDialog({
                builder: (): void => {
                  this.customDialogComponent();
                },
                alignment: DialogAlignment.Bottom,
                keyboardAvoidMode: KeyboardAvoidMode.DEFAULT, // 软键盘弹出时，弹出框自动避让
                keyboardAvoidDistance: LengthMetrics.vp(0) // 软键盘弹出时与弹出框的距离为0vp
              }).catch((error) => {
                hilog.error(DOMAIN, 'testTag',
                  'openCustomDialog error: %{public}s', error);
              })
            })
        }
        .width('100%')
      }
      .height('100%')
    }
  }
}

// [End custom_dialog_with_key_board_distance]