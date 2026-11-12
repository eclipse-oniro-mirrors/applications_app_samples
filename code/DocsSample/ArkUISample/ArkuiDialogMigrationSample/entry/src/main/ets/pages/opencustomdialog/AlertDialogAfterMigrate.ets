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

// [Start alert_dialog_after_migrate]
import { DialogBaseAlignment, DialogDismissal, DialogPresenter, DialogResult } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import resource from '../../common/resource';

@Entry
@Component
export struct AlertDialogAfterMigrate {
  private presenter: DialogPresenter = this.getUIContext().getDialogPresenter();
  @State result: ResourceStr = '';

  build() {
    NavDestination() {
      Row() {
        Column() {
          Text('AlertDialog' + resource.resourceToString($r('app.string.migrate_sample_zh')))
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 })

          Button(resource.resourceToString($r('app.string.old_interface_zh')) + '：showAlertDialog')
            .width('90%')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.result = $r('app.string.OldInterfaceAlertDialogOnClick');
            })

          Button(resource.resourceToString($r('app.string.new_interface_zh')) + '：DialogPresenter.present')
            .width('90%')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showNewAlertDialog();
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

  private showNewAlertDialog(): void {
    this.presenter.present({
      title: '提示',
      message: { content: '确认删除？' },
      buttons: [
        {
          value: '取消', action: () => {
          this.result = '用户点击取消';
        }
        },
        {
          value: '确认', action: () => {
          this.result = '用户点击确认';
        }
        }
      ],
      alignment: DialogBaseAlignment.BOTTOM,
      onWillDismiss: (dismissal: DialogDismissal) => {
        this.result = 'onWillDismiss, reason: ' + dismissal.reason;
        dismissal.dismiss();
      }
    }).then((result: DialogResult) => {
      this.result = 'present success, dialogId: ' + result.dialogId;
    }).catch((error: BusinessError) => {
      this.result = `present error: ${error.code}`;
    });
  }
}
// [End alert_dialog_after_migrate]