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

// [Start action_sheet_after_migrate]
import { DialogDismissal, DialogPresenter, DialogResult } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
export struct ActionSheetAfterMigrate {
  private presenter: DialogPresenter = this.getUIContext().getDialogPresenter();
  @State result: string = '';

  build() {
    NavDestination() {
      Row() {
        Column() {
          Text('ActionSheet 迁移示例')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 })

          Button('老接口：showActionSheet')
            .width('90%')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.result = '老接口示例请参考 ts-methods-action-sheet.md';
            })

          Button('新接口：DialogPresenter.present（列表选择弹窗）')
            .width('90%')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showNewActionSheet();
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

  private showNewActionSheet(): void {
    this.presenter.present({
      title: '选择操作',
      message: { content: '请选择一个操作' },
      autoCancel: true,
      sheets: [
        { title: '复制', action: () => { this.result = '复制'; } },
        { title: '删除', action: () => { this.result = '删除'; } }
      ],
      onWillDismiss: (dismissal: DialogDismissal) => {
        this.result = '取消';
        dismissal.dismiss();
      }
    }).then((result: DialogResult) => {
      this.result = 'present success, dialogId: ' + result.dialogId;
    }).catch((error: BusinessError) => {
      this.result = `present error: ${error.code}`;
    });
  }
}
// [End action_sheet_after_migrate]