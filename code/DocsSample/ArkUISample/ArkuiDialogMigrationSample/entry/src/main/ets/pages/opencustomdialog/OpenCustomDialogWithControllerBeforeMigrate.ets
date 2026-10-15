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

// [Start open_custom_dialog_with_controller_before_migrate]
import { ComponentContent, promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class Params {
  public text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(16)
      .margin({ bottom: 10 })
  }
  .padding(20)
}

@Entry
@Component
export struct OpenCustomDialogWithControllerBeforeMigrate {
  private dialogController: promptAction.DialogController = new promptAction.DialogController();
  @State result: string = '';

  build() {
    NavDestination() {
      Column() {
        Button('打开 openCustomDialogWithController')
          .onClick(() => {
            let contentNode = new ComponentContent(this.getUIContext(), wrapBuilder(buildText),
              new Params('自定义弹窗内容'));
            this.getUIContext()
              .getPromptAction()
              .openCustomDialogWithController(contentNode,
                this.dialogController, {
                  autoCancel: true,
                  alignment: DialogAlignment.Center
                })
              .then(() => {
                this.result = 'opened';
              })
              .catch((error: BusinessError) => {
                this.result = `open error: ${error.code}`;
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
// [End open_custom_dialog_with_controller_before_migrate]