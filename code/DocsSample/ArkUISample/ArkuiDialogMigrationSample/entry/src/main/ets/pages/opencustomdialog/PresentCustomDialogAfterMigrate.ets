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

// [Start present_custom_dialog_after_migrate]
import { DialogBaseController, DialogPresenter, DialogResult } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
export struct PresentCustomDialogAfterMigrate {
  private presenter: DialogPresenter = this.getUIContext().getDialogPresenter();
  private controller: DialogBaseController = new DialogBaseController();
  @State result: string = '';

  build() {
    NavDestination() {
      Row() {
        Column() {
          Text('presentCustomDialog 迁移示例')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 })

          Button('老接口：promptAction.presentCustomDialog')
            .width('90%')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.result = '老接口示例请参考promptAction文档';
            })

          Button('新接口：DialogPresenter.present（自定义弹窗）')
            .width('90%')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showNewCustomDialog();
            })

          if (this.result) {
            Text(this.result)
              .fontSize(14)
              .margin({ top: 10 })
          }
        }
        .width('100%')
      }
      .height('100%')
    }
  }

  @Builder
  CustomComponentContent() {
    Column() {
      Text('自定义弹窗内容')
        .fontSize(16)
        .margin({ bottom: 10 })
      Button('关闭弹窗')
        .onClick(() => {
          this.controller.close();
        })
    }
    .padding(20)
  }

  private showNewCustomDialog(): void {
    this.presenter.present(() => {
      this.CustomComponentContent()
    }, {
      controller: this.controller,
      autoCancel: true
    }).then((result: DialogResult) => {
      this.result = 'present success, dialogId: ' + result.dialogId;
    }).catch((error: BusinessError) => {
      this.result = `present error: ${error.code}`;
    });
  }
}
// [End present_custom_dialog_after_migrate]