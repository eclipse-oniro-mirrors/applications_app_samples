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

// [Start DynInteropStaStatemgmtV1LocalStorage]
// entry/src/main/ets/pages/StatemgmtV1LocalStorage.ets
import { LocalStoragePage } from 'static_module';

// 初始化ArkTS-Dyn中的LocalStorage数据
const para: Record<string, string> = { 'LinkA': 'test' };
const storageInst: LocalStorage = new LocalStorage(para);

@Entry(storageInst) // 传入LocalStorage实例
@Component
struct Index {
  // ArkTS-Dyn使用LocalStorage
  @LocalStorageLink('LinkA') localLink: string = 'dynamicA';
  @LocalStorageProp('LinkA') localProp: string = 'dynamicA';

  build() {
    Column() {
      Text('----- dynamic localstoragelink -----')
        .fontSize(20)
        .margin(10)
      Text(`LocalStorage LinkA: ${this.localLink}`)
        .fontSize(20)
        .margin(10)
      Button('change LinkA')
        .onClick((e: ClickEvent) => {
          // 点击后同步更新ArkTS-Dyn和ArkTS-Sta中的Text组件
          this.localLink += 'a';
        })
        .width(300)
        .margin(10)
      Text('----- dynamic localstorageprop -----')
        .fontSize(20)
        .margin(10)
      Text(`LocalStorage PropA: ${this.localProp}`)
        .fontSize(20)
        .margin(10)
      Button('change PropA')
        .onClick((e: ClickEvent) => {
          // 点击后仅更新当前Text组件
          this.localProp += 'a';
        })
        .width(300)
        .margin(10)
      LocalStoragePage()
    }
    .width('100%')
  }
}
// [End DynInteropStaStatemgmtV1LocalStorage]
