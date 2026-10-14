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

// [Start custom_dialog_after_migrate]
import { DialogPresenter, DialogBaseAlignment, DialogResult, ComponentContent } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

// 定义参数类，用于向自定义弹出框内容传递数据
class Params {
  text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

// 自定义弹出框内容的构建器函数
@Builder
function buildText(params: Params) {
  Column({ space: 20 }) {
    Text(params.text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 36 })
    // 关闭弹出框按钮，通过ComponentContent引用关闭弹出框
    Button('关闭弹窗')
      .onClick(() => {
        dialogPresenter?.dismiss(contentNode)
          .then(() => {
            console.info('dismiss success');
          })
          .catch((error: BusinessError) => {
            console.error(`dismiss error code is ${error.code}, message is ${error.message}`);
          })
      })
  }
}

let contentNode: ComponentContent<Object> | null = null;
// 全局变量，保存DialogPresenter实例
let dialogPresenter: DialogPresenter | null = null;

@Entry
@Component
export struct CustomDialogAfterMigrate {
  @State result: string = '';

  aboutToAppear(): void {
    // 获取DialogPresenter实例
    dialogPresenter = this.getUIContext().getDialogPresenter();
    // 创建ComponentContent，绑定自定义构建器函数和参数
    contentNode = new ComponentContent(this.getUIContext(), wrapBuilder(buildText), new Params("自定义弹窗内容"));
  }

  build() {
    NavDestination() {
      Row() {
        Column() {
          Text('CustomDialog 迁移示例')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 })

          Button('老接口：@CustomDialog + CustomDialogController')
            .width('90%')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showOldCustomDialog();
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

  private showOldCustomDialog(): void {
    this.result = '老接口示例请参考 DialogProject 工程';
  }

  private showNewCustomDialog(): void {
    dialogPresenter?.present(contentNode, {
      alignment: DialogBaseAlignment.CENTER,
      autoCancel: true,
      maskColor: 0x33000000
    }).then((result: DialogResult) => {
      this.result = 'present success, dialogId: ' + result.dialogId;
    }).catch((error: BusinessError) => {
      this.result = `present error: ${error.code}`;
    });
  }
}
// [End custom_dialog_after_migrate]