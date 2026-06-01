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

// [Start DynInteropStaStatemgmtV1AppStorageData]
// entry/src/main/ets/pages/StatemgmtV1AppStorageData.ets
import { AppStoragePage } from 'static_module'; // 导入ArkTS-Sta自定义组件

// ArkTS-Dyn使用AppStorage，初始化key 'LinkA'
AppStorage.setOrCreate<string>('LinkA', '333');

@Entry
@Component
struct Index {
  @StorageLink('LinkA') appLink: string = 'dynamicA';
  @StorageProp('LinkA') appProp: string = 'dynamicA';

  build() {
    Column() {
      Text('----- dynamic storagelink -----')
        .fontSize(20)
        .margin(10)
      Text(`Storage LinkA: ${this.appLink}`)
        .fontSize(20)
        .margin(10)
      Button('change LinkA')
        .onClick((e: ClickEvent) => {
          // 点击后同步更新ArkTS-Dyn和ArkTS-Sta中的Text组件
          this.appLink += 'a';
        })
        .width(300)
        .margin(10)
      Text('----- dynamic storageprop -----')
        .fontSize(20)
        .margin(10)
      Text(`Storage PropA: ${this.appProp}`)
        .fontSize(20)
        .margin(10)
      Button('change PropA')
        .onClick((e: ClickEvent) => {
          // 点击后仅更新当前Text组件
          this.appProp += 'a';
        })
        .width(300)
        .margin(10)
      AppStoragePage()
    }
    .width('100%')
  }
}
// [End DynInteropStaStatemgmtV1AppStorageData]
