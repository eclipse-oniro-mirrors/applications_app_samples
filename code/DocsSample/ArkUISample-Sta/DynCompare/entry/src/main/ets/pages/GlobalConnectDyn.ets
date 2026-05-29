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

// [Start global_connect_dyn]
import { PersistenceV2, UIUtils, Type } from '@kit.ArkUI';

@ObservedV2
class Inner {
  @Trace age: number = 24; // 迁移时需将number改为int等静态类型
}

@ObservedV2
class Info {
  @Trace userInfo: number = 1;
  @Trace arr: Array<Inner> = new Array<Inner>();
}

@ObservedV2
class Person {
  @Trace userName: string = 'John';
  userId: number = 1;
  @Type(Info) // 迁移时需移除@Type装饰器，嵌套类型改由defaultSubCreators统一注册
  @Trace info: Info = new Info();
}

@Entry
@ComponentV2
struct Index {
  // globalConnect调用迁移时需：
  // - 添加显式泛型类型参数<Array<Person>>
  // - type参数改为Class.from<Array<Person>>()
  // - defaultSubCreator改为defaultSubCreators，传入StorageDefaultSubCreators
  @Local stateVar: Array<Person> = PersistenceV2.globalConnect({
    type: Array<Person>,
    key: 'PersonArray',
    // 动态中defaultCreator需要使用makeObserved包装，确保从磁盘恢复的数据具备观察能力以实现自动持久化
    // 静态中可无需makeObserved包装，去除即可
    defaultCreator: () => UIUtils.makeObserved(new Array<Person>()),
    // 迁移时需替换为defaultSubCreators + StorageDefaultSubCreators
    defaultSubCreator: () => new Person()
  })!;

  build() {
    Column() {
      Text(`length: ${this.stateVar.length}`)
      Button('push')
        .onClick(() => {
          this.stateVar.push(new Person());
        })
      List() {
        ForEach(this.stateVar, (item: Person, index: number) => {
          ListItem() {
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
        }, (item: Person, index: number) => {
          return item.userName + index.toString();
        })
      }
    }
  }
}
// [End global_connect_dyn]

@Builder
export function globalConnectDynBuilder(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.global_connect_dyn_title'))
}
