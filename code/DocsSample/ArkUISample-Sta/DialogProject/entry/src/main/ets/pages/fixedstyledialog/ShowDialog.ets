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
// [Start show_dialog_example]
// xxx.ets
import {
  Column,
  ColumnOptions,
  Button,
  NavDestination,
  Entry,
  Component,
  $r
} from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PromptAction } from '@ohos.arkui.UIContext'

const DOMAIN: int = 0x0000;

@Entry
@Component
export struct ShowDialogExample {
  build(): void {
    // [StartExclude show_dialog_example]
    NavDestination() {
      // [EndExclude show_dialog_example]
      Column({ space: 12 } as ColumnOptions) {
        Column() {
          Button('ShowDialog')
            .margin(30)
            .onClick(() => {
              let uiContext = this.getUIContext();
              let promptAction: PromptAction = uiContext.getPromptAction();
              try {
                promptAction.showDialog({
                  title: 'showDialog Title Info',
                  message: 'Message Info',
                  buttons: [
                    {
                      text: 'button1',
                      color: '#000000'
                    },
                    {
                      text: 'button2',
                      color: '#000000'
                    }
                  ]
                }, (err, data): void => {
                  if (err) {
                    hilog.error(DOMAIN, 'testTag', 'showDialog err: %{public}s', err);
                    return;
                  }
                });
              } catch (error) {
                hilog.error(DOMAIN, 'testTag', 'showdialog args error: %{public}s', error);
              }
            })
        }.width('100%')
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })
      // [StartExclude show_dialog_example]
    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.ShowDialog_title')替换为实际资源文件，在本示例中该资源文件的value值为"对话框"
    .title($r('app.string.ShowDialog_title'))
    // [EndExclude show_dialog_example]
  }
}
// [End show_dialog_example]