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

// [Start dialog_focus]

import {
  Column,
  ColumnOptions,
  Text,
  TextInput,
  NavDestination,
  Entry,
  Component,
  FlexAlign,
  Builder
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
export struct Index {
  // [Start dialog_focus_text]
  @State dialogIdIndex: int = 0;
  // 请在resources\base\element\string.json文件中配置name为'dialog_message'，value为非空字符串的资源
  private message: string =
    this.getUIContext().getHostContext()?.resourceManager.getStringByNameSync('dialog_message') as string;

  @Builder
  customDialogComponent(): void {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.message + this.dialogIdIndex)
        .fontSize(30)
    }
    .height(200)
    .padding(5)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  // [End dialog_focus_text]

  build(): void {
    NavDestination() {
      Column({ space: 5 } as ColumnOptions) {
        // [Start dialog_focus_text_input]
        TextInput()
          .onChange(() => {
            this.dialogIdIndex++;
            this.getUIContext().getPromptAction().openCustomDialog({
              builder: (): void => {
                this.customDialogComponent();
              },
              focusable: false
            }).then((dialogId: int) => {
              setTimeout(() => {
                this.getUIContext().getPromptAction().closeCustomDialog(dialogId);
              }, 3000);
            });
          })
        // [End dialog_focus_text_input]
      }.width('100%')
    }
  }
}

// [End dialog_focus]