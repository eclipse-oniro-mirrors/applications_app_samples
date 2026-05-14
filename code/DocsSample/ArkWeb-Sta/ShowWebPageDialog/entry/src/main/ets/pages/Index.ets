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
import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Button('AchieveAlertDialogPage1Button')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/AchieveAlertDialogPage1',
          }, (error: BusinessError<void> | null) => {
            if (error) {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
            }
          })
        })

      Button('AchieveAlertDialogPage2Button')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/AchieveAlertDialogPage2',
          }, (error: BusinessError<void> | null) => {
            if (error) {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
            }
          })
        })

      Button('AchievePromptDialogPageButton')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/AchievePromptDialogPage',
          }, (error: BusinessError<void> | null) => {
            if (error) {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
            }
          })
        })

    }.height('100%')
    .width('100%')
  }
}
