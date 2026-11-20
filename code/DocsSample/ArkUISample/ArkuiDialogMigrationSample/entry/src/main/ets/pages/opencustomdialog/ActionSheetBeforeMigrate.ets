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

// [Start action_sheet_before_migrate]
@Entry
@Component
export struct ActionSheetBeforeMigrate {
  @State result: string = '';

  build() {
    NavDestination() {
      Column() {
        Button('打开 ActionSheet')
          .onClick(() => {
            this.getUIContext().showActionSheet({
              title: '选择操作',
              message: '请选择一个操作',
              autoCancel: true,
              sheets: [
                {
                  title: '复制', action: () => {
                  this.result = '复制';
                }
                },
                {
                  title: '删除', action: () => {
                  this.result = '删除';
                }
                }
              ],
              cancel: () => {
                this.result = '取消';
              }
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
// [End action_sheet_before_migrate]