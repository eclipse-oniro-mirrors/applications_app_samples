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

import { NavDestination, $r } from '@kit.ArkUI';
// [Start AppStorageUI]
import { AppStorage, Button, ClickEvent, Column, Component, Entry, LocalStorage, LocalStorageLink, StorageLink, Text } from '@kit.ArkUI';

class Data {
  code: number;

  constructor(code: number) {
    this.code = code;
  }
}

@Entry
@Component
struct Index {
  @StorageLink('StorageLinkBasic') storageLink: number = 1;
  @LocalStorageLink('LocalStorageLinkBasic') localStorageLink: number = 1;
  @StorageLink('StorageLinkObject') storageLinkObject: Data = new Data(1);
  @LocalStorageLink('LocalStorageLinkObject') localStorageLinkObject: Data = new Data(1);
  static {
    AppStorage.setOrCreate<number>('StorageLinkBasic', 47);
    AppStorage.setOrCreate<Data>('StorageLinkObject', new Data(50));
  }

  build() {
    Column() {
      Button(`From AppStorage ${this.storageLink}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.storageLink += 1;
        })

      Button(`From LocalStorage ${this.localStorageLink}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.localStorageLink += 1;
        })

      Button(`From AppStorage ${this.storageLinkObject.code}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // class属性监听需要使用@Observed装饰才能观察变化
          this.storageLinkObject.code += 1;
        })

      Button(`From LocalStorage ${this.localStorageLinkObject.code}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // class属性监听需要使用@Observed装饰才能观察变化
          this.localStorageLinkObject.code += 1;
        })
    }
    .width('100%')
    .height('100%')
  }
}
// [End AppStorageUI]

@Builder
export function appStorageUI(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.app_storage_ui_title'))
}