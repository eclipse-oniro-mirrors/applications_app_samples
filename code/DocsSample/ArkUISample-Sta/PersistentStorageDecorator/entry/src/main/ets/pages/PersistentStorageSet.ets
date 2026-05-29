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
// [Start PersistentStorageSet]
import { AppStorage, Button, ClickEvent, Column, Component, Entry, Observed, PersistentStorage, StorageLink, Text } from '@kit.ArkUI';

@Entry
@Component
struct SetSample {
  success: boolean = PersistentStorage.persistProp<Set<string>>('set', new Set<string>(['1', '2', '3']),
    (set: Set<string>): jsonx.JsonElement => {
      const root = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
      const setEle = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
      set.forEach((v: string) => {
        setEle.setElement(v, jsonx.JsonElement.createString(v));
      });
      root.setElement('set', setEle);
      return root;
    }, 
    (json: jsonx.JsonElement): Set<string> => {
      let setEles: jsonx.JsonElement = json.getElement('set');
      let set: Set<string> = new Set<string>();
      for (let ele of setEles) {
        set.add(ele[1].asString());
      }
      return set;
    }
  );
  @StorageLink('set') set: Set<string> = new Set<string>([
    'value1',
    'value2',
    'value3'
  ]);

  build() {
    Column() {
      Text(`${Array.from(this.set)}`)
        .fontSize(20)
        .margin(10)
      Button(`set add:`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
            this.set.add('value4');
        })
      Button(`set delete:`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
            this.set.delete('value4');
        })
      Button(`set change by appStorage:`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.set = new Set<string>([
            'value4',
            'value5',
            'value6'
          ]);
          if (AppStorage.has('set')) {
            AppStorage.set<Set<string>>('set', this.set);
          }
        })
    }
    .width('100%')
  }
}

// [End PersistentStorageSet]

@Builder
export function persistentStorageSet(): void {
  NavDestination() {
    SetSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistent_storage_set_title'))
}