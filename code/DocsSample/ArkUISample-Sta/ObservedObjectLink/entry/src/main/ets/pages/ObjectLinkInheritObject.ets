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
// [Start ObjectLinkInheritObject]
import { Button, Column, Component, Entry, Observed, State, Text } from '@kit.ArkUI';

@Observed
class Animal {
  name: string;
  age: int;

  constructor(name: string, age: int) {
    this.name = name;
    this.age = age;
  }
}

@Observed
class Dog extends Animal {
  kinds: string;

  constructor(name: string, age: int, kinds: string) {
    super(name, age);
    this.kinds = kinds;
  }
}

@Entry
@Component
struct Index {
  @State dog: Dog = new Dog('Molly', 2, 'Husky'); // 初始化dog对象

  build() {
    Column() {
      Button(`${this.dog.name}`)
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.dog.name = 'DouDou';
        })

      Button(`${this.dog.age}`)
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.dog.age = 3;
        })

      Button(`${this.dog.kinds}`)
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.dog.kinds = 'Samoyed';
        })
    }
    .width('100%')
  }
}
// [End ObjectLinkInheritObject]

@Builder
export function objectLinkInheritObject(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.object_link_inherit_object_title'))
}