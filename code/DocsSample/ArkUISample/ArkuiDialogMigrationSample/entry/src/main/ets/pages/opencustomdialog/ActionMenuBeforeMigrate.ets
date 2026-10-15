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

// [Start action_menu_before_migrate]
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
export struct ActionMenuBeforeMigrate {
  @State result: string = '';

  build() {
    NavDestination() {
      Column() {
        Button('打开 showActionMenu')
          .onClick(() => {
            this.getUIContext()
              .getPromptAction()
              .showActionMenu({
                title: '选择操作',
                buttons: [
                  { text: '保存', color: '#0000FF' },
                  { text: '分享', color: '#0000FF' },
                  { text: '删除', color: '#FF0000' }
                ]
              })
              .then((data) => {
                this.result = 'click button index: ' + data.index;
              })
              .catch((error: BusinessError) => {
                this.result = `showActionMenu error: ${error.code}`;
              });
          })

        if (this.result) {
          Text(this.result)
            .fontSize(14)
            .margin({ top: 10 })
        }
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
  }
}
// [End action_menu_before_migrate]