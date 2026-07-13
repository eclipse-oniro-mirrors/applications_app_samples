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
// [Start AppStorageMap]
import { AppStorage, Button, ClickEvent, Column, Component, Entry, Row, StorageLink, Text, ForEach } from '@kit.ArkUI';

@Entry
@Component
struct MapSample {
  @StorageLink('map') message: Map<number, string> = new Map<number, string>([[0, 'a'], [1, 'b'], [3, 'c']]); // 使用@StorageLink装饰Map类型变量

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.message.entries()), (item: [number, string]) => {
          Text(`key: ${item[0]}, value: ${item[1]}`)
            .fontSize(20)
            .margin(10)
        })
        Button('init map')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            this.message = new Map<number, string>([[0, 'a'], [1, 'b'], [3, 'c']]);
        })
        Button('set new one')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            // 新增键值对，触发UI刷新
            this.message.set(4, 'd');
        })
        Button('clear')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            // 清空Map，触发UI刷新
            this.message.clear();
        })
        Button('replace the existing one')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            // 更新键值对，触发UI刷新
            this.message.set(0, 'aa');
        })
        Button('delete the existing one')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            // 删除键值对，触发UI刷新
            AppStorage.get<Map<number, string>>('map')?.delete(0);
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End AppStorageMap]

@Builder
export function appStorageMap(): void {
  NavDestination() {
    MapSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.app_storage_map_title'))
}