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
// [Start StateInterface]
import { ClickEvent, Column, Component, Entry, State, Text } from '@kit.ArkUI';
interface Info {
  name: string;
  age: int;
}
@Entry
@Component
struct Index {
  // 装饰字面量
  @State info: Info = { name: 'Jack', age: 25 } as Info;
  build() {
    Column() {
      Text(`info.name: ${this.info.name}`)
        .onClick((e: ClickEvent) => {
          this.info.name = 'Tom'; // 变化可观察
        })
    }
  }
}
// [End StateInterface]

@Builder
export function stateInterface(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.state_interface_title'))
}