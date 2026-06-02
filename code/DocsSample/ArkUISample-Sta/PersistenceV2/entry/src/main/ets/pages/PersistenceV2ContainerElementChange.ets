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
// [Start persistence_v2_container_element_change]
import { PersistenceV2, ObservedV2, Trace, Entry, ComponentV2, Local, Column, Text, Button, List, ListItem, ForEach, StorageDefaultCreator } from '@kit.ArkUI';
import { contextConstant } from '@kit.AbilityKit';

@ObservedV2
export class Person {
  @Trace userName: string = 'John';
  userId: int = 1;
}

const creators = new Map<Class, StorageDefaultCreator<object>>([
  [Class.from<Person>(), () => new Person()]
]);

@Entry
@ComponentV2
struct PersistenceV2ContainerElementChangeExample {
  // 提供默认元素new Person()，框架可据此检测到类型变更并跳过旧数据恢复
  @Local stateVar: Array<Person> = PersistenceV2.globalConnect<Array<Person>>({
    type: Class.from<Array<Person>>(),
    key: 'PersonArray',
    defaultCreator: () => {
      return new Array<Person>(new Person());
    },
    areaMode: contextConstant.AreaMode.EL1,
    enableAutoSave: true,
    defaultSubCreators: creators
  })!;

  build() {
    Column(undefined) {
      Text(`length: ${this.stateVar.length}`)
      // 点击按钮添加新的Person对象
      Button('add Person')
        .onClick(() => {
          let p = new Person();
          p.userName = 'user_' + this.stateVar.length.toString();
          this.stateVar.push(p);
        })
      List() {
        ForEach(this.stateVar, (item: Any, index: int) => {
          ListItem() {
            Column() {
              if (item instanceof Person) {
                Text(`[${index}] ${(item as Person).userName}`)
                  .fontSize(20)
              } else if (item instanceof int) {
                Text(`[${index}] ${item as int}`)
                  .fontSize(20)
              } else {
                Text(`[${index}] NOT Person or int: ${Class.ofAny(item)!.getName()}`)
                  .fontSize(20)
              }
            }
          }
        }, (item: Any, index: int) => {
          return index.toString();
        })
      }
    }
  }
}
// [End persistence_v2_container_element_change]

@Builder
export function persistenceV2ContainerElementChange(): void {
  NavDestination() {
    PersistenceV2ContainerElementChangeExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistence_v2_container_element_title'))
}
