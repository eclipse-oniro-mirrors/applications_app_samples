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
// [Start ProviderConsumerComplexType]
import { Button, ClickEvent, Column, ComponentV2, Consumer, Divider, Entry, ForEach, ObservedV2, Provider, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class User {
  @Trace name: string;
  @Trace age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

const data: User[] = [new User('Json', 10), new User('Eric', 15)];

@Entry
@ComponentV2
struct Parent {
  @Provider('data') users: User[] = data;

  build() {
    Column() {
      Button('add new user')
        .onClick((e: ClickEvent) => {
          this.users.push(new User('Molly', 18));
        })
      Button('age++')
        .onClick((e: ClickEvent) => {
          this.users[0].age++;
        })
      Button('change name')
        .onClick((e: ClickEvent) => {
          this.users[0].name = 'Shelly';
        })
      Button('reset users')
        .onClick((e: ClickEvent) => {
          this.users = [new User('Json', 10), new User('Eric', 15)];
        })       
      Child()
    }
  }
}

@ComponentV2
struct Child {
  @Consumer('data') users: User[] = [];

  build() {
    Column() {
      ForEach(this.users, (item: User) => {
        Column() {
          Text(`name: ${item.name}`).fontSize(30)
          Text(`age: ${item.age}`).fontSize(30)
          Divider()
        }
      })
    }
  }
}
// [End ProviderConsumerComplexType]

@Builder
export function providerConsumerComplexType(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provider_consumer_complex_type_title'))
}