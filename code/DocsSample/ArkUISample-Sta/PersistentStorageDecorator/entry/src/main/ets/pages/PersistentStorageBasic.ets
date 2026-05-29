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
// [Start PersistentStorageBasic]
import { Button, ClickEvent, Column, Component, Entry, PersistentStorage, Row, State, StorageLink, Text } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @StorageLink('aProp') aProp: number = 48;
  static {
    PersistentStorage.persistProp<number>('aProp', 47);
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
        // 应用退出时会保存当前结果；重新启动后，会显示上一次的保存结果。
        // 未修改时默认值为47
        Text(`${this.aProp}`)
          .onClick((e: ClickEvent) => {
            this.aProp += 1;
          })
      }
    }
  }
}

// [End PersistentStorageBasic]

@Builder
export function persistentStorageBasic(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistent_storage_basic_title'))
}