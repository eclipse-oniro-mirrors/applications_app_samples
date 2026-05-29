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

// [Start RememberClassType]
import { rememberVariable, MutableVariable, UIUtils, Entry, Component, Column,
         Text, Builder, Observed, Button, ColumnOptions } from '@kit.ArkUI';

@Observed
class Person {
  name: string
  constructor(name: string) {
    this.name = name;
  }
}

@Builder
function ClassTypeBuilder() {
  let person: MutableVariable<Person> = rememberVariable<Person>(new Person('ArkTS'));
  Text(`My name is ${person.value.name}`)
  Button('Change name in builder')
    .onClick(() => {
      person.value.name += '!';
    })
}
@Entry
@Component
struct ClassTypePage {
  build() {
    Column({space: '10px'} as ColumnOptions) {
      ClassTypeBuilder()
    }.width('100%')
  }
}
// [End RememberClassType]

@Builder
export function rememberClassType(): void {
  NavDestination() {
    ClassTypePage()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.remember_class_type_title'))
}
