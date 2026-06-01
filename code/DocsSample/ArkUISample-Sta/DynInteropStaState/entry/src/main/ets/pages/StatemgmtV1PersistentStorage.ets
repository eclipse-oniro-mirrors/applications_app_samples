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

// [Start DynInteropStaStatemgmtV1PersistentStorage]
// entry/src/main/ets/pages/StatemgmtV1PersistentStorage.ets
import { PersistentStoragePage } from 'static_module';

// ArkTS-Dyn使用PersistentStorage，初始化key 'LinkA'
PersistentStorage.persistProp('LinkA', 'hello');

@Entry
@Component
struct Index {
  // ArkTS-Dyn使用PersistentStorage
  @StorageLink('LinkA') persistLink: string = 'staticB';
  @StorageProp('LinkA') persistProp: string = 'staticB';

  build() {
    Column() {
      Text('----- dynamic storagelink -----')
        .fontSize(20)
        .margin(10)
      // 退出应用后重新进入，修改保留
      Text(`PersistentStorage LinkA: ${this.persistLink}`)
        .fontSize(20)
        .margin(10)
      Button('change LinkA')
        .onClick((e: ClickEvent) => {
          // 点击后同步更新ArkTS-Dyn和ArkTS-Sta中的Text组件
          this.persistLink += 'a';
        })
        .width(300)
        .margin(10)
      Text('----- dynamic storageprop -----')
        .fontSize(20)
        .margin(10)
      // 退出应用后重新进入，同步为LinkA的值
      Text(`PersistentStorage PropB: ${this.persistProp}`)
        .fontSize(20)
        .margin(10)
      Button('change PropB')
        .onClick((e: ClickEvent) => {
          // 点击后仅更新当前Text组件
          this.persistProp += 'a';
        })
        .width(300)
        .margin(10)
      PersistentStoragePage()
    }
    .width('100%')
  }
}