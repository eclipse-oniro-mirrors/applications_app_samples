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

// [Start custom_dialog_new_interface]
// Index.ets
import {
  ComponentContent,
  DialogPresenter,
  DialogResult,
  uiMaterial
} from '@kit.ArkUI';
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
    // 更新弹出框样式按钮，动态修改蒙层颜色、对齐方式和偏移量
    Button('Update dialog')
      .onClick(() => {
        dialogPresenter?.update(contentNode, {
          offset: { dx: 0, dy: 30 }
        })
          .then(() => {
            console.info('update success');
          })
          .catch((error: BusinessError) => {
            console.error(`update error code is ${error.code}, message is ${error.message}`);
          })
      })
    // 关闭弹出框按钮，通过ComponentContent引用关闭弹出框
    Button('Dismiss dialog')
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

// 全局变量，保存DialogPresenter实例
let dialogPresenter: DialogPresenter | null = null;
// 全局变量，保存自定义弹出框的ComponentContent实例
let contentNode: ComponentContent<Object> | null = null;

@Entry
@Component
export struct CustomDialogNewInterface {
  @State message: string = 'custom dialog';

  aboutToAppear(): void {
    // 获取DialogPresenter实例
    dialogPresenter = this.getUIContext().getDialogPresenter();
    // 创建ComponentContent，绑定自定义构建器函数和参数
    contentNode = new ComponentContent(this.getUIContext(), wrapBuilder(buildText), new Params(this.message));
  }

  build() {
    NavDestination() {
      Row() {
        Column({ space: 10 }) {
          Button('Present custom dialog')
            .id("PresentDialog")
            .onClick(() => {
              // 弹出自定义样式弹出框，传入ComponentContent和配置选项
              dialogPresenter?.present(contentNode, {
                systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.REGULAR })
              })
              // 弹出成功，获取弹出框ID
                .then((result: DialogResult) => {
                  console.info('present success, dialogId: ' + result.dialogId);
                })
                .catch((error: BusinessError) => {
                  console.error(`present error code is ${error.code}, message is ${error.message}`);
                })
            })
        }.width('100%').height('100%').justifyContent(FlexAlign.Center)
      }
      .height('100%')
    }
  }
}
// [End custom_dialog_new_interface]