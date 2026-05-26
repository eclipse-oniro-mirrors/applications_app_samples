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
// [Start MakeObservedWithDecorator]
import { ClickEvent, Column, Component, Entry, State, Text, UIUtils } from '@kit.ArkUI';
interface Info {
  name: string;
  age: number;
}
interface Person {
  info: Info;
}
@Entry
@Component
struct Index {
  @State person: Person = UIUtils.makeObserved({ info: { name: 'Jack', age: 25} as Info} as Person) as Person;
  build() {
    Column() {
      Text(`info.name: ${this.person.info.name}`)
        .onClick((e: ClickEvent) => {
          // @State本身无法观察name变化，但makeObserved支持观察嵌套
          // 此时以makeObserved为准，因此name变化可观察
          this.person.info.name = 'Tom';
        })
    }
  }
}

// [End MakeObservedWithDecorator]

@Builder
export function makeObservedWithDecorator(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.make_observed_with_decorator_title'))
}