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

// [Start present_custom_dialog_before_migrate]
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
export struct PresentCustomDialogBeforeMigrate {
  private dialogController: promptAction.DialogController = new promptAction.DialogController();
  @State result: string = '';

  @Builder customDialogComponent() {
    Column() {
      Text('自定义弹窗内容')
        .fontSize(16)
        .margin({ bottom: 10 })
      Button('关闭弹窗')
        .onClick(() => {
          this.dialogController.close();
        })
    }
    .padding(20)
  }

  build() {
    NavDestination() {
      Column() {
        Button('打开 presentCustomDialog')
          .onClick(() => {
            this.getUIContext()
              .getPromptAction()
              .presentCustomDialog(() => {
                this.customDialogComponent()
              }, this.dialogController, { autoCancel: true })
              .then((dialogId: number) => {
                this.result = 'present success, dialogId: ' + dialogId;
              })
              .catch((error: BusinessError) => {
                this.result = `present error: ${error.code}`;
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
// [End present_custom_dialog_before_migrate]