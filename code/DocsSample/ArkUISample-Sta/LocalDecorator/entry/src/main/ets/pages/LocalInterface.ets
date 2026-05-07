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
// [Start LocalInterface]
import { Button, ClickEvent, Column, ComponentV2, Entry, Local, Text } from '@kit.ArkUI';

export interface Info {
  name: string;
  age: number;
}

@Entry
@ComponentV2
struct Index {
  // 装饰字面量
  @Local info: Info = { name: 'Jack', age: 25 } as Info;

  build() {
    Column() {
      Text(`info.name: ${this.info.name}`)
      Text(`info.age: ${this.info.age}`)
      Button('change info')
        .onClick((e: ClickEvent) => {
          this.info = { name: 'Tom', age: 18 } as Info; // 变化可观察
        })
      Button('change info.name')
        .onClick((e: ClickEvent) => {
          this.info.name = 'Lucy'; // 变化无法观察
        })
    }
  }
}
// [End LocalInterface]

@Builder
export function localInterface(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_interface_title'))
}