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

// [Start StaDynStorageSp]
// entry/src/main/ets/pages/StaDynStorageSp.ets
import { Entry, Component, Column, Button, ClickEvent } from '@ohos.arkui.component';
import { StorageLink } from '@ohos.arkui.stateManagement';

import { StoragePropPage } from 'dynamic_module'; // 导入ArkTS-Dyn自定义组件

@Entry
@Component
struct Index {
  // 初始化ArkTS-Sta中的AppStorage数据
  @StorageLink('PropA') storageLink: number = 1;

  build() {
    Column() {
      StoragePropPage()
      Button('update value')
        .onClick((value: ClickEvent) => {
          // 更新AppStorage中的数据，并同步更新ArkTS-Dyn组件
          this.storageLink += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStorageSp]
