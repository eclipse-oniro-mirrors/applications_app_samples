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
// [Start persistence_v2_array]
import { PersistenceV2, ObservedV2, Trace, Entry, ComponentV2, Local, Column, Text, Button, ForEach, List, ListItem, StorageDefaultSubCreators } from '@kit.ArkUI';
import { contextConstant } from '@kit.AbilityKit';

// 定义嵌套的数据类
@ObservedV2
export class Inner {
  @Trace age: int = 24;
}
@ObservedV2
export class Info {
  @Trace userInfo: int = 1;
  @Trace arr: Array<Inner> = new Array<Inner>();
}
@ObservedV2
export class Person {
  @Trace userName: string = 'John';
  userId: int = 1;
  @Trace info: Info = new Info();
}

// 为所有嵌套类型注册构造器，确保反序列化时恢复正确的类型
const creators = new StorageDefaultSubCreators([
  [Class.from<Person>(), () => new Person()],
  [Class.from<Inner>(), () => new Inner()],
  [Class.from<Info>(), () => new Info()]
]);

@Entry
@ComponentV2
struct PersistenceV2ArrayExample {
  // 通过globalConnect持久化Array<Person>类型数据
  @Local stateVar: Array<Person> = PersistenceV2.globalConnect<Array<Person>>({
    type: Class.from<Array<Person>>(),
    key: 'PersonArray',
    defaultCreator: () => {
      return new Array<Person>();
    },
    areaMode: contextConstant.AreaMode.EL1,
    enableAutoSave: true,
    defaultSubCreators: creators
  })!;

  build() {
    Column(undefined) {
      Text(`length: ${this.stateVar.length}`)
      // 点击按钮向数组中添加一个新的Person对象
      Button('push')
        .onClick(() => {
          this.stateVar.push(new Person());
        })
      List() {
        ForEach(this.stateVar, (item: Person, index: int) => {
          ListItem() {
            if (item instanceof Person) {
              Column() {
                Text(`item: ${item.userName}`)
                  .fontSize(30)
                  // 点击修改当前item的userName、userInfo，并添加Inner对象到arr中
                  .onClick(() => {
                    item.userName += '~';
                    item.info.userInfo++;
                    let inner = new Inner();
                    inner.age = item.info.userInfo;
                    item.info.arr.push(inner);
                  })
                Text(`userInfo: ${item.info.userInfo}`)
                Text(`arr: ${JSON.stringify(item.info.arr)}`)
              }
            } else {
              Text(`${Class.of(item).getName()}`)
            }
          }
        }, (item: Person, index: int) => {
          return item.userName + item.info.userInfo + Math.random().toString();
        })
      }
    }
  }
}
// [End persistence_v2_array]

@Builder
export function persistenceV2Array(): void {
  NavDestination() {
    PersistenceV2ArrayExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistence_v2_array_title'))
}
