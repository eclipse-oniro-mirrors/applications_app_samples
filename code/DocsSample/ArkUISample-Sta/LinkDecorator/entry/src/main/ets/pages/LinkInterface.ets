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
// [Start LinkInterface]
import { ClickEvent, Column, Component, Entry, Link, State, Text } from '@kit.ArkUI';

interface Info {
  name: string;
  age: int;
}

@Component
struct Child {
  @Link info: Info;
  build() {
    Column() {
      Text(`Child info.name: ${this.info.name}`)
        .onClick((e: ClickEvent) => {
          this.info.name = 'Jerry';
        })
    }
  }
}

@Entry
@Component
struct Parent {
  // 装饰字面量
  @State info: Info = { name: 'Bob', age: 22 } as Info;
  build() {
    Column() {
      Text(`Parent info.name: ${this.info.name}`)
        .onClick((e: ClickEvent) => {
          this.info.name = 'Tom';
        })
      Child({info: this.info})
    }
  }
}
// [End LinkInterface]

@Builder
export function linkInterface(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.link_interface_title'))
}