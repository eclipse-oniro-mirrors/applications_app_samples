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
// [Start PersistentStorageUnionType]
import { AppStorage, Button, ClickEvent, Column, Component, Entry, Observed, PersistentStorage, StorageLink, Text } from '@kit.ArkUI';

@Entry
@Component
struct UnionTypeSample {
  success: boolean = PersistentStorage.persistProp<number | string | null>('union', 12,
    (val: number | string | null): jsonx.JsonElement => {
      const root = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
      const unionElmt = new jsonx.JsonElement();
      if (Class.of(val) === Class.from<number>()) {
        unionElmt.setDouble(val as Double);
      } else if (val === null) {
        unionElmt.setNull();
      } else {
        unionElmt.setString(val as string);
      }
      root.setElement('union', unionElmt);
      return root;
    }, 
    (json: jsonx.JsonElement): number | string | null => {
      let unionElmt: jsonx.JsonElement = json.getElement('union');
      if (unionElmt.jsonType === jsonx.JsonType.JsonNumber) {
        return unionElmt.asInteger();
      } else if (unionElmt.jsonType === jsonx.JsonType.JsonNull) {
        return null;
      } else {
        return unionElmt.asString();
      }
    } 
  );
  @StorageLink('union') union: number | string | null = 'strUnion';

  build() {
    Column() {
      // @LocalStorage装饰set，set api操作，能触发PersistentStorage的持久化
      Text(`${this.union}`)
        .fontSize(20)
        .margin(10)
      Button(`union change:`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          if (Class.of(this.union) === Class.from<number>()) {
            this.union = null
          } else if (this.union === null) {
            this.union = 'strUnion';
          } else {
            this.union = 3;
          }
        })    
      // appStorage整体赋值能触发PersistentStorage的持久化
      Button(`map change by appStorage:`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          if (AppStorage.has('union')) {
            AppStorage.set<number | string | null>('union', 15);
          }
        })
    }
    .width('100%')
  }
}
// [End PersistentStorageUnionType]

@Builder
export function persistentStorageUnionType(): void {
  NavDestination() {
    UnionTypeSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistent_storage_union_type_title'))
}