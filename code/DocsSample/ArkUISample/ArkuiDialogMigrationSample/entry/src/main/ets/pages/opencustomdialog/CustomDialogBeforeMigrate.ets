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

// [Start custom_dialog_before_migrate]
@CustomDialog
struct CustomDialogExample {
  controller?: CustomDialogController
  build() {
    Column() {
      Text('自定义弹窗内容')
      Button('关闭').onClick(() => { this.controller?.close() })
    }
  }
}

@Entry
@Component
export struct CustomDialogBeforeMigrate {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample(),
    alignment: DialogAlignment.Center,
    autoCancel: true,
    maskColor: 0x33000000
  })
  build() {
    NavDestination() {
      Column() {
        Button('打开弹窗').onClick(() => {
          this.dialogController.open()
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
  }
}
// [End custom_dialog_before_migrate]