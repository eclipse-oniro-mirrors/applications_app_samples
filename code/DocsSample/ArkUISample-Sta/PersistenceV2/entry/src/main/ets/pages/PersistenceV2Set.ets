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
// [Start persistence_v2_set]
import { PersistenceV2, ObservedV2, Trace, Entry, ComponentV2, Local, Column, Text, Button, List, ListItem, ForEach, StorageDefaultCreator } from '@kit.ArkUI';
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
struct PersistenceV2SetExample {
  // 通过globalConnect持久化Set<Person>类型数据
  @Local stateVar: Set<Person> = PersistenceV2.globalConnect<Set<Person>>({
    type: Class.from<Set<Person>>(),
    key: 'PersonSet',
    defaultCreator: () => {
      return new Set<Person>();
    },
    areaMode: contextConstant.AreaMode.EL1,
    enableAutoSave: true,
    defaultSubCreators: creators
  })!;
  // 记录最后添加的Person，用于remove操作
  @Local lastPerson: Person | undefined = undefined;

  build() {
    Column(undefined) {
      Text(`set size: ${this.stateVar.size}`)
      // 点击按钮创建一个新的Person对象并添加到Set中
      Button('add')
        .onClick(() => {
          let p = new Person();
          p.userName = 'user_' + this.stateVar.size.toString();
          p.userId = this.stateVar.size;
          p.inner.age = 20 + this.stateVar.size;
          this.stateVar.add(p);
          this.lastPerson = p;
        })
      // 点击按钮移除Set中最后添加的元素
      Button('remove last')
        .onClick(() => {
          if (this.lastPerson && this.stateVar.has(this.lastPerson!)) {
            this.stateVar.delete(this.lastPerson!);
          } else {
            let s = this.stateVar.size;
            this.stateVar.forEach((val: Person) => {
              if (--s === 0) {
                this.stateVar.delete(val);
              }
            });
          }
        })
      List() {
        ForEach(Array.from(this.stateVar.values()), (item: Person, index: int) => {
          ListItem() {
            Column() {
              if (item instanceof Person) {
                Text(`[${index}] ${item.userName}`)
                  .fontSize(20)
                Text(`userId: ${item.userId}, inner.age: ${item.inner.age}`)
                  .fontSize(16)
              }
            }
          }
        }, (item: Person, index: int) => {
          return item.userId + item.userName + index.toString();
        })
      }
    }
  }
}
// [End persistence_v2_set]

@Builder
export function persistenceV2Set(): void {
  NavDestination() {
    PersistenceV2SetExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistence_v2_set_title'))
}
