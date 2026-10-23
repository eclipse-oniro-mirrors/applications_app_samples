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

// [Start show_dialog_after_migrate]
import { DialogPresenter, DialogResult } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
export struct ShowDialogAfterMigrate {
  private presenter: DialogPresenter = this.getUIContext().getDialogPresenter();
  @State result: ResourceStr = '';

  build() {
    NavDestination() {
      Row() {
        Column() {
          Text('showDialog 迁移示例')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 })

          Button('老接口：promptAction.showDialog')
            .width('90%')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.result = $r('app.string.OldInterfaceShowDialogOnClick');
            })

          Button('新接口：DialogPresenter.present（对话框）')
            .width('90%')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showNewDialog();
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

  private showNewDialog(): void {
    this.presenter.present({
      title: '提示',
      message: { content: '确认删除？' },
      buttons: [
        { value: '取消', action: () => { this.result = '取消'; } },
        { value: '确认', action: () => { this.result = '确认'; } }
      ]
    }).then((result: DialogResult) => {
      this.result = 'present success, dialogId: ' + result.dialogId;
    }).catch((error: BusinessError) => {
      this.result = `present error: ${error.code}`;
    });
  }
}
// [End show_dialog_after_migrate]