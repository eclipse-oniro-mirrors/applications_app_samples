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
// [Start PersistentStorageMap]
import { AppStorage, Button, ClickEvent, Column, Component, Entry, Observed, PersistentStorage, StorageLink, Text } from '@kit.ArkUI';

@Entry
@Component
struct MapSample {
  success: boolean = PersistentStorage.persistProp<Map<string, string>>('map', new Map<string, string>([['1', 'value1']]),
    (map: Map<string, string>): jsonx.JsonElement => {
      const root = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
      const mapEle = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
      map.forEach((v: string, k: string) => {
        mapEle.setElement(k, jsonx.JsonElement.createString(v));
      });
      root.setElement('map', mapEle);
      return root;
    }, 
    (json: jsonx.JsonElement): Map<string, string> => {
      let mapEles: jsonx.JsonElement = json.getElement('map');
      let map: Map<string, string> = new Map<string, string>();
      for (let ele of mapEles) {
        map.set(ele[0], ele[1].asString());
      }
      return map;
    }
  );
  @StorageLink('map') map: Map<string, string> = new Map<string, string>([
    ['1', 'value1'],
    ['2', 'value2'],
    ['3', 'value3']
  ]);

  build() {
    Column() {
      // @LocalStorage装饰set，set api操作，能触发PersistentStorage的持久化
      Text(`${this.map}`)
        .fontSize(20)
        .margin(10)
      Button(`map add:`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
            this.map.set('4', 'value4');
        })
      Button(`map delete:`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
            this.map.delete('4');
        })
      // appStorage整体赋值能触发PersistentStorage的持久化
      Button(`map change by appStorage:`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.map = new Map<string, string>([
            ['4', 'value4'],
            ['5', 'value5'],
            ['6', 'value6']
          ]);
          if (AppStorage.has('map')) {
            AppStorage.set<Map<string, string>>('map', this.map);
          }
        })
    }
    .width('100%')
  }
}
// [End PersistentStorageMap]

@Builder
export function persistentStorageMap(): void {
  NavDestination() {
    MapSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistent_storage_map_title'))
}