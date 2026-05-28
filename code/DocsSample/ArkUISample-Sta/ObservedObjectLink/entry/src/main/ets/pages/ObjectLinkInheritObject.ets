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
import { Button, Column, CommonMethod, Component, Entry, Observed, State, Text, TextAlign, TextAttribute } from '@kit.ArkUI';

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

function commonStyles(this: TextAttribute): TextAttribute {
  return this.width(320).margin(10).fontSize(30).textAlign(TextAlign.Center);
}

@Entry
@Component
struct Index {
  @State dog: Dog = new Dog('Molly', 2, 'Husky');

  pressedStyles(instance: CommonMethod) {
    instance.backgroundColor('#ffd5d5d5');
  }

  normalStyles(instance: CommonMethod) {
    instance.backgroundColor('#ffffff');
  }

  build() {
    Column() {
      Text(`${this.dog.name}`)
        .commonStyles()
        .stateStyles({
          pressed: this.pressedStyles,
          normal: this.normalStyles
        })
        .onClick((e) => {
          this.dog.name = 'DouDou';
        })

      Text(`${this.dog.age}`)
        .commonStyles()
        .stateStyles({
          pressed: this.pressedStyles,
          normal: this.normalStyles
        })
        .onClick((e) => {
          this.dog.age = 3;
        })

      Text(`${this.dog.kinds}`)
        .commonStyles()
        .stateStyles({
          pressed: this.pressedStyles,
          normal: this.normalStyles
        })
        .onClick((e) => {
          this.dog.kinds = 'Samoyed';
        })
    }
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