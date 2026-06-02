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

import { NavDestination, $r, PersistenceV2, ObservedV2, Trace, Entry, ComponentV2, Local,
  Column, Text, Button, ForEach, List, ListItem, StorageDefaultSubCreators } from '@kit.ArkUI';

// [Start global_connect_sta]
// 迁移步骤1：移除Type的导入，新增StorageDefaultSubCreators的导入
import { PersistenceV2, ObservedV2, Trace, Entry, ComponentV2, Local,
  Column, Text, Button, ForEach, List, ListItem, StorageDefaultSubCreators } from '@kit.ArkUI';
import { contextConstant } from '@kit.AbilityKit';

@ObservedV2
export class Inner {
  @Trace age: int = 24; // 迁移步骤2：数值类型从number改为int等静态类型
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
  @Trace info: Info = new Info(); // 迁移步骤3：移除@Type装饰器，嵌套类型通过defaultSubCreators统一注册
}

// 迁移步骤4：使用StorageDefaultSubCreators批量注册所有嵌套类型的构造器，替代动态中的@Type + defaultSubCreator
const creators = new StorageDefaultSubCreators([
  [Class.from<Person>(), () => new Person()],
  [Class.from<Inner>(), () => new Inner()],
  [Class.from<Info>(), () => new Info()]
]);

@Entry
@ComponentV2
struct Index {
  // 迁移步骤5：globalConnect调用变更
  // - 添加显式泛型类型参数<Array<Person>>
  // - type参数使用Class.from<Array<Person>>()替代Array<Person>
  // - defaultCreator无需再调用makeObserved包装，去除即可
  // - 使用defaultSubCreators替代defaultSubCreator，传入上述批量注册的构造器集合
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
                  .onClick(() => {
                    item.userName += '~';
                    item.info.userInfo++;
                    let inner = new Inner();
                    inner.age = item.info.userInfo;
                    item.info.arr.push(inner);
                  })
                Text(`userInfo: ${item.info.userInfo}`)
              }
            }
          }
        }, (item: Person, index: int) => {
          return item.userName + index.toString();
        })
      }
    }
  }
}
// [End global_connect_sta]

@Builder
export function globalConnectStaBuilder(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.global_connect_sta_title'))
}
