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

// [Start DynInteropStaStatemgmtV1Environment]
// entry/src/main/ets/pages/StatemgmtV1Environment.ets
import { EnvironmentPage } from 'static_module'; // 导入ArkTS-Sta自定义组件

// ArkTS-Dyn使用Environment，获取fontScale
Environment.envProp<number>('fontScale', 2.0);

@Entry
@Component
struct Index { // 定义ArkTS-Dyn主组件
  @StorageLink('fontScale') fontScaleLink: number = 3.0;
  @StorageProp('fontScale') fontScaleProp: number = 3.0;

  build() {
    Column() {
      Text('----- dynamic storagelink -----')
        .fontSize(20)
        .margin(10)
      Text(`Environment fontscale link: ${this.fontScaleLink}`)
        .fontSize(this.fontScaleLink)
        .margin(10)
      Button('change fontScale link')
        .onClick((e: ClickEvent) => {
          // 点击后同步更新ArkTS-Dyn和ArkTS-Sta中的Text组件
          this.fontScaleLink += 1.0;
        })
        .width(300)
        .margin(10)
      Text('----- dynamic storageprop -----')
        .fontSize(20)
        .margin(10)
      Text(`Environment fontscale prop: ${this.fontScaleProp}`)
        .fontSize(this.fontScaleProp)
        .margin(10)
      Button('change fontScale prop')
        .onClick((e: ClickEvent) => {
          // 点击后仅更新当前Text组件
          this.fontScaleProp += 1.0;
        })
        .width(300)
        .margin(10)
      EnvironmentPage()
    }
    .width('100%')
  }
}
// [End DynInteropStaStatemgmtV1Environment]
