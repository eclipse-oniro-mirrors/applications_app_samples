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

// [Start alert_dialog_before_migrate]
@Entry
@Component
export struct AlertDialogBeforeMigrate {
  @State result: string = '';

  build() {
    NavDestination() {
      Column() {
        Button('打开 AlertDialog')
          .onClick(() => {
            this.getUIContext().showAlertDialog({
              title: '提示',
              message: '确认删除？',
              autoCancel: true,
              buttons: [
                {
                  value: '取消', action: () => {
                  this.result = '取消';
                }
                },
                {
                  value: '确认', action: () => {
                  this.result = '确认';
                }
                }
              ],
              cancel: () => {
                this.result = 'cancel';
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
// [End alert_dialog_before_migrate]