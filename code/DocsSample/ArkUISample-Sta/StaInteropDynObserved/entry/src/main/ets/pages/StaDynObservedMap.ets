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

// [Start StaDynObservedMap]
// entry/src/main/ets/pages/StaDynObservedMap.ets
import { Entry, Component, Row, Column, Scroll, Button, ClickEvent, Text, ColumnOptions, RowOptions, Color, Margin, Divider, ForEach } from '@ohos.arkui.component';
import { State, Link, PropRef, Provide, Consume, LocalStorageLink, StorageLink, LocalStoragePropRef, StoragePropRef, Observed, Track } from '@ohos.arkui.stateManagement';

// 引用ArkTS-Dyn中@Observed装饰的数据
import { MapInfo } from 'dynamic_module';

@Entry
@Component
struct MapSample {
  // 接收ArkTS-Dyn中@Observed装饰的数据
  @State stateInfo: MapInfo = new MapInfo();
  @Provide provideInfo: MapInfo = new MapInfo();
  @LocalStorageLink('mapA') localStorageLinkInfo: MapInfo = new MapInfo();
  @StorageLink('mapB') storageLinkInfo: MapInfo = new MapInfo();
  @LocalStoragePropRef('mapC') localStoragePropRefInfo: MapInfo = new MapInfo();
  @StoragePropRef('mapD') storagePropRefInfo: MapInfo = new MapInfo();

  build() {
    Row({ space: 5 } as RowOptions) {
      Column() {
        // UI中观察ArkTS-Dyn中@Observed装饰的数据的变化
        Text('@State: ' + `${Array.from(this.stateInfo.memberMap.entries())}`)
          .margin(10)
        Text('@Provide: ' + `${Array.from(this.provideInfo.memberMap.entries())}`)
          .margin(10)
        Text('@LocalStorageLink: ' + `${Array.from(this.localStorageLinkInfo.memberMap.entries())}`)
          .margin(10)
        Text('@StorageLink: ' + `${Array.from(this.storageLinkInfo.memberMap.entries())}`)
          .margin(10)
        Text('@LocalStoragePropRef: ' + `${Array.from(this.localStoragePropRefInfo.memberMap.entries())}`)
          .margin(10)
        Text('@StoragePropRef: ' + `${Array.from(this.storagePropRefInfo.memberMap.entries())}`)
          .margin(10)
        // 单独为动态@Observed装饰的类中的所有成员赋值
        Button('map member')
          .onClick(() => {
            this.stateInfo.memberMap = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
            this.provideInfo.memberMap = new Map<number, string>([[1, 'a'], [2, 'b'], [3,'c']]);
            this.localStorageLinkInfo.memberMap = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
            this.storageLinkInfo.memberMap = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
            this.localStoragePropRefInfo.memberMap = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
            this.storagePropRefInfo.memberMap = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
          })
          .margin(10)
          .width('80%')
        // 创建新的对象整体为动态@Observed装饰的类中的成员赋值
        Button('map whole')
          .onClick(() => {
            let data = new MapInfo();
            data.memberMap = new Map<number, string>([[0, 'c'], [1, 'a'], [3, 'b']]);
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
        Button('map one')
          .onClick(() => {
            this.stateInfo.memberMap = new Map<number, string>([[1, 'a']]);
            this.provideInfo.memberMap = new Map<number, string>([[1, 'a']]);
            this.localStorageLinkInfo.memberMap = new Map<number, string>([[1, 'a']]);
            this.storageLinkInfo.memberMap = new Map<number, string>([[1, 'a']]);
            this.localStoragePropRefInfo.memberMap = new Map<number, string>([[1, 'a']]);
            this.storagePropRefInfo.memberMap = new Map<number, string>([[1, 'a']]);
          })
          .margin(10)
          .width('80%')
        Button('clear')
          .onClick(() => {
            this.stateInfo.memberMap = new Map<number, string>();
            this.provideInfo.memberMap = new Map<number, string>();
            this.localStorageLinkInfo.memberMap = new Map<number, string>();
            this.storageLinkInfo.memberMap = new Map<number, string>();
            this.localStoragePropRefInfo.memberMap = new Map<number, string>();
            this.storagePropRefInfo.memberMap = new Map<number, string>();
          })
          .margin(10)
          .width('80%')
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End StaDynObservedMap]