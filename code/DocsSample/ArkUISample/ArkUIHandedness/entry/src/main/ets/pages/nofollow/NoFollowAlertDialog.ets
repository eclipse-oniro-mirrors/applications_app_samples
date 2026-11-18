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

// [Start no_follow_import]
import { HandednessFollowMode } from '@kit.ArkUI';
// [End no_follow_import]

@Entry
@Component
struct NoFollowAlertDialog {
  build() {
    Column() {
      Button('AlertDialog')
        .id('no_follow_dialog_btn')
        .margin(20)
        .onClick(() => {
          // [Start no_follow_alert_dialog]
          this.getUIContext().showAlertDialog({
            title: 'AlertDialog Title',
            message: 'AlertDialog Text',
            primaryButton: {
              value: '确定',
              action: () => {
                console.info('primaryButton');
              }
            },
            secondaryButton: {
              value: '取消',
              action: () => {
                console.info('secondaryButton');
              }
            },
            adaptToHandedness: HandednessFollowMode.NONE
          });
          // [End no_follow_alert_dialog]
        })
    }
    .height('100%')
    .width('100%')
  }
}
