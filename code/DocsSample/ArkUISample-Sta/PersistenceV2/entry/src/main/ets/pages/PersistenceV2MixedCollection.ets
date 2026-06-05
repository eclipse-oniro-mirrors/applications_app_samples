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
// [Start persistence_v2_mixed_collection]
import { PersistenceV2, ObservedV2, Trace, Entry, ComponentV2, Local, Column, Text, Button, List, ListItem, ForEach, StorageDefaultCreator } from '@kit.ArkUI';
import { contextConstant } from '@kit.AbilityKit';

// 定义嵌套的数据类
@ObservedV2
export class Inner {
  @Trace age: int = 0;
}

@ObservedV2
export class Person {
  @Trace userName: string = '';
  @Trace inner: Inner = new Inner();
}

// 定义包含多种集合类型的数据类
@ObservedV2
export class MixedData {
  @Trace tags: Array<string> = new Array<string>();
  @Trace people: Map<string, Person> = new Map<string, Person>();
  @Trace unique: Set<Person> = new Set<Person>();
}

// 为所有嵌套类型注册构造器
const creators = new Map<Class, StorageDefaultCreator<object>>([
  [Class.from<MixedData>(), () => new MixedData()],
  [Class.from<Person>(), () => new Person()],
  [Class.from<Inner>(), () => new Inner()]
]);

@Entry
@ComponentV2
struct PersistenceV2MixedCollectionExample {
  // 通过globalConnect持久化包含Array、Map、Set的MixedData对象
  @Local stateVar: MixedData = PersistenceV2.globalConnect<MixedData>({
    type: Class.from<MixedData>(),
    key: 'MixedData',
    defaultCreator: () => {
      return new MixedData();
    },
    areaMode: contextConstant.AreaMode.EL1,
    enableAutoSave: true,
    defaultSubCreators: creators
  })!;

  build() {
    Column(undefined) {
      Text(`tags: ${this.stateVar.tags.length}`)
        .fontSize(20)
        .margin(10)
      Text(`people: ${this.stateVar.people.size}`)
        .fontSize(20)
        .margin(10)
      Text(`unique: ${this.stateVar.unique.size}`)
        .fontSize(20)
        .margin(10)

      // 点击按钮初始化所有集合数据
      Button('init all')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.stateVar.tags.push('tag_a');
          let p1 = new Person();
          p1.userName = 'alice';
          p1.inner.age = 25;
          this.stateVar.people.set('alice', p1);
          this.stateVar.unique.add(p1);
        })
      // 点击按钮向tags数组中添加新标签
      Button('add tag')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.stateVar.tags.push('tag_' + this.stateVar.tags.length.toString());
        })
      // 点击按钮创建新的Person对象并添加到Map中
      Button('add person to map')
        .width(300)
        .margin(10)
        .onClick(() => {
          let p = new Person();
          p.userName = 'user_' + this.stateVar.people.size.toString();
          p.inner.age = 20 + this.stateVar.people.size;
          this.stateVar.people.set(p.userName, p);
        })
      // 点击按钮创建新的Person对象并添加到Set中
      Button('add person to set')
        .width(300)
        .margin(10)
        .onClick(() => {
          let p = new Person();
          p.userName = 'set_' + this.stateVar.unique.size.toString();
          p.inner.age = 20 + this.stateVar.unique.size;
          this.stateVar.unique.add(p);
        })

      // 展示tags数组内容
      Text('--- tags ---')
        .fontSize(20)
        .margin(10)
      List() {
        ForEach(this.stateVar.tags, (tag: string, index: int) => {
          ListItem() {
            Text(`[${index}] ${tag}`)
              .fontSize(20)
              .margin(10)
          }
          .width('100%')
        }, (tag: string, index: int) => {
          return tag + index.toString();
        })
      }

      // 展示people Map内容
      Text('--- people (map) ---')
        .fontSize(20)
        .margin(10)
      List() {
        ForEach(Array.from(this.stateVar.people.entries()), (entry: Tuple2<string, Person>, index: int) => {
          ListItem() {
            Column() {
              if (entry.$1 instanceof Person) {
                Text(`${entry.$0}: ${entry.$1.userName} (age ${entry.$1.inner.age})`)
                  .fontSize(20)
                  .margin(10)
              }
            }
            .width('100%')
          }
        }, (entry: Tuple2<string, Person>, index: int) => {
          return entry.$0 + index.toString();
        })
      }

      // 展示unique Set内容
      Text('--- unique (set) ---')
        .fontSize(20)
        .margin(10)
      List() {
        ForEach(Array.from(this.stateVar.unique.values()), (item: Person, index: int) => {
          ListItem() {
            Column() {
              if (item instanceof Person) {
                Text(`${item.userName} (age ${item.inner.age})`)
                  .fontSize(20)
                  .margin(10)
              }
            }
            .width('100%')
          }
        }, (item: Person, index: int) => {
          return item.userName + index.toString();
        })
      }
    }
    .width('100%')
  }
}
// [End persistence_v2_mixed_collection]

@Builder
export function persistenceV2MixedCollection(): void {
  NavDestination() {
    PersistenceV2MixedCollectionExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistence_v2_mixed_collection_title'))
}
