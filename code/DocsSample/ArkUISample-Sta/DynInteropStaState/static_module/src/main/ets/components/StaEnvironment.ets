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

// [Start DynInteropStaStatemgmtV1StaEnvironment]
// static_module/src/main/ets/components/StaEnvironment.ets
import { Component, Row, Column, Text, Button, ClickEvent } from '@ohos.arkui.component';
import { Environment, StorageLink, StoragePropRef } from '@ohos.arkui.stateManagement';

@Component
export struct EnvironmentPage { // 定义ArkTS-Sta自定义组件
  // ArkTS-Sta绑定ArkTS-Dyn Environment数据
  @StorageLink('fontScale') fontScaleLink: number = 4.0;
  @StoragePropRef('fontScale') fontScaleProp: number = 4.0;

  build(): void {
    Row() {
      Column() {
        Text('----- static storagelink -----')
          .fontSize(20)
          .margin(10)
        Text(`Environment fontscale link: ${this.fontScaleLink}`)
          .fontSize(this.fontScaleLink)
          .margin(10)
        Button('change fontscale link')
          .onClick((e: ClickEvent) => {
            // 点击后同步更新ArkTS-Dyn和ArkTS-Sta中的Text组件，fontSize加2
            this.fontScaleLink += 2.0;
          })
          .width(300)
          .margin(10)
        Text('----- static storagepropref -----')
          .fontSize(20)
          .margin(10)
        Text(`Environment fontscale prop: ${this.fontScaleProp}`)
          .fontSize(this.fontScaleProp)
          .margin(10)
        Button('change fontscale prop')
          .onClick((e: ClickEvent) => {
            // 点击后仅更新当前Text组件，fontSize加2
            this.fontScaleProp += 2.0;
          })
          .width(300)
          .margin(10)
      }
    }
  }
}
// [End DynInteropStaStatemgmtV1StaEnvironment]
