'use static'
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

// [Start DynInteropStaStatemgmtV1StaAppStorageData]
// static_module/src/main/ets/components/StaAppStorageData.ets
import { Component, Row, Column, Text, Button, ClickEvent } from '@ohos.arkui.component';
import { AppStorage, StorageLink, StoragePropRef } from '@ohos.arkui.stateManagement';

@Component
export struct AppStoragePage {
  // ArkTS-Sta绑定ArkTS-Dyn AppStorage数据
  @StorageLink('LinkA') appLink: string = 'staticA';
  @StoragePropRef('LinkA') appProp: string = 'staticA';

  build(): void {
    Row() {
      Column() {
        Text('----- static storagelink -----')
          .fontSize(20)
          .margin(10)
        Text(`Storage LinkA: ${this.appLink}`)
          .fontSize(20)
          .margin(10)
        Button('change LinkA')
          .onClick((e: ClickEvent) => {
            // 点击后同步更新ArkTS-Dyn和ArkTS-Sta中的Text组件
            this.appLink += 'b';
          })
          .width(300)
          .margin(10)
        Text('----- static storagepropref -----')
          .fontSize(20)
          .margin(10)
        Text(`Storage PropA: ${this.appProp}`)
          .fontSize(20)
          .margin(10)
        Button('change PropA')
          .onClick((e: ClickEvent) => {
            // 点击后仅更新当前Text组件
            this.appProp += 'b';
          })
          .width(300)
          .margin(10)
      }
    }
  }
}
// [End DynInteropStaStatemgmtV1StaAppStorageData]
