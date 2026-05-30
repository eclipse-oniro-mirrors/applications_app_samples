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

// [Start StaDynObservedSet]
// entry/src/main/ets/pages/StaDynObservedSet.ets
import { Entry, Component, Row, Column, Scroll, Button, ClickEvent, Text, ColumnOptions, RowOptions, Color, Margin, Divider, ForEach } from '@ohos.arkui.component';
import { State, Link, PropRef, Provide, Consume, LocalStorageLink, StorageLink, LocalStoragePropRef, StoragePropRef, Observed, Track } from '@ohos.arkui.stateManagement';

// 引用ArkTS-Dyn中@Observed装饰的数据
import { SetInfo } from 'dynamic_module';

@Entry
@Component
struct SetSample {
  @State stateInfo: SetInfo = new SetInfo();
  @Provide provideInfo: SetInfo = new SetInfo();
  @LocalStorageLink('setA') localStorageLinkInfo: SetInfo = new SetInfo();
  @StorageLink('setB') storageLinkInfo: SetInfo = new SetInfo();
  @LocalStoragePropRef('setC') localStoragePropRefInfo: SetInfo = new SetInfo();
  @StoragePropRef('setD') storagePropRefInfo: SetInfo = new SetInfo();

  build() {
    Row({ space: 5 } as RowOptions) {
      Column() {
        // UI中观察ArkTS-Dyn中@Observed装饰的数据的变化
        Text('@State: ' + `${Array.from(this.stateInfo.memberSet.entries())}`)
          .margin(10)
        Text('@Provide: ' + `${Array.from(this.provideInfo.memberSet.entries())}`)
          .margin(10)
        Text('@LocalStorageLink: ' + `${Array.from(this.localStorageLinkInfo.memberSet.entries())}`)
          .margin(10)
        Text('@StorageLink: ' + `${Array.from(this.storageLinkInfo.memberSet.entries())}`)
          .margin(10)
        Text('@LocalStoragePropRef: ' + `${Array.from(this.localStoragePropRefInfo.memberSet.entries())}`)
          .margin(10)
        Text('@StoragePropRef: ' + `${Array.from(this.storagePropRefInfo.memberSet.entries())}`)
          .margin(10)
        // 单独为动态@Observed装饰的类中的所有成员赋值
        Button('set member')
          .onClick(() => {
            this.stateInfo.memberSet = new Set<number>([4, 3, 2, 1, 0]);
            this.provideInfo.memberSet = new Set<number>([4, 3, 2, 1, 0]);
            this.localStorageLinkInfo.memberSet = new Set<number>([4, 3, 2, 1, 0]);
            this.storageLinkInfo.memberSet = new Set<number>([4, 3, 2, 1, 0]);
            this.localStoragePropRefInfo.memberSet = new Set<number>([4, 3, 2, 1, 0]);
            this.storagePropRefInfo.memberSet = new Set<number>([4, 3, 2, 1, 0]);
          })
          .margin(10)
          .width('80%')
        // new新的对象整体为动态@Observed装饰的类中的成员赋值
        Button('set whole')
          .onClick(() => {
            let data = new SetInfo();
            data.memberSet = new Set<number>([1, 2, 3, 5, 4]);
            this.stateInfo = data;
            this.provideInfo = data;
            this.localStorageLinkInfo = data;
            this.storageLinkInfo = data;
            this.localStoragePropRefInfo = data;
            this.storagePropRefInfo = data;
          })
          .margin(10)
          .width('80%')
        // 单独为动态@Observed装饰的类中的某一个成员赋值
        Button('set one')
          .onClick(() => {
            this.stateInfo.memberSet = new Set<number>([1]);
            this.provideInfo.memberSet = new Set<number>([1]);
            this.localStorageLinkInfo.memberSet = new Set<number>([1]);
            this.storageLinkInfo.memberSet = new Set<number>([1]);
            this.localStoragePropRefInfo.memberSet = new Set<number>([1]);
            this.storagePropRefInfo.memberSet = new Set<number>([1]);
          })
          .margin(10)
          .width('80%')
        Button('clear')
          .onClick(() => {
            this.stateInfo.memberSet = new Set<number>();
            this.provideInfo.memberSet = new Set<number>();
            this.localStorageLinkInfo.memberSet = new Set<number>();
            this.storageLinkInfo.memberSet = new Set<number>();
            this.localStoragePropRefInfo.memberSet = new Set<number>();
            this.storagePropRefInfo.memberSet = new Set<number>();
          })
          .margin(10)
          .width('80%')
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End StaDynObservedSet]