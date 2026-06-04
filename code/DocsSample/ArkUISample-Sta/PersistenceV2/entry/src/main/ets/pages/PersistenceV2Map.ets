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
// [Start persistence_v2_map]
import { PersistenceV2, ObservedV2, Trace, Entry, ComponentV2, Local, Column, Text, Button, List, ListItem, StorageDefaultCreator, ForEach } from '@kit.ArkUI';
import { contextConstant } from '@kit.AbilityKit';

// 定义嵌套的数据类
@ObservedV2
export class Inner {
  @Trace age: int = 24;
}

@ObservedV2
export class Person {
  @Trace userName: string = 'John';
  userId: int = 1;
  @Trace inner: Inner = new Inner();
}

// 为所有嵌套类型注册构造器
const creators = new Map<Class, StorageDefaultCreator<object>>([
  [Class.from<Person>(), () => new Person()],
  [Class.from<Inner>(), () => new Inner()]
]);

@Entry
@ComponentV2
struct PersistenceV2MapExample {
  // 通过globalConnect持久化Map<string, Person>类型数据
  @Local stateVar: Map<string, Person> = PersistenceV2.globalConnect<Map<string, Person>>({
    type: Class.from<Map<string, Person>>(),
    key: 'PersonMap',
    defaultCreator: () => {
      return new Map<string, Person>();
    },
    areaMode: contextConstant.AreaMode.EL1,
    enableAutoSave: true,
    defaultSubCreators: creators
  })!;

  build() {
    Column(undefined) {
      Text(`map size: ${this.stateVar.size}`)
        .fontSize(20)
        .margin(10)
      // 点击按钮创建一个新的Person对象并添加到Map中
      Button('add')
        .width(300)
        .margin(10)
        .onClick(() => {
          let p = new Person();
          p.userName = 'user_' + this.stateVar.size.toString();
          p.userId = this.stateVar.size;
          p.inner.age = 20 + this.stateVar.size;
          this.stateVar.set('key_' + this.stateVar.size.toString(), p);
        })
      // 点击按钮删除最后一个Map条目
      Button('delete last')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.stateVar.delete('key_' + (this.stateVar.size - 1));
        })
      List() {
        ForEach(Array.from(this.stateVar.entries()), (entry: Tuple2<string, Person>, index: int) => {
          ListItem() {
            Column() {
              let key = entry.$0 as string;
              let val = entry.$1 as Person;
              if (val instanceof Person) {
                Column() {
                  Button(`[${key}] ${val.userName}`)
                    .width(300)
                    .margin(10)
                    // 点击修改当前条目的userName和age
                    .onClick(() => {
                      val.userName += '~';
                      val.inner.age++;
                    })
                  Text(`userId: ${val.userId}, inner.age: ${val.inner.age}`)
                    .fontSize(20)
                    .margin(10)
                }
                .width('100%')
              }
            }
            .width('100%')
          }
        }, (entry: Tuple2<string, Person>, index: int) => {
          return entry.$0 + index.toString();
        })
      }
    }
    .width('100%')
  }
}
// [End persistence_v2_map]

@Builder
export function persistenceV2Map(): void {
  NavDestination() {
    PersistenceV2MapExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistence_v2_map_title'))
}
