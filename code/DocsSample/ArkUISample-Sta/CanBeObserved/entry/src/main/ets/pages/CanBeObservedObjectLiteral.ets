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
// [Start CanBeObservedObjectLiteral]
import { Entry, Text, Column, Component, ComponentV2, Button, State, UIUtils, Param, Require } from '@kit.ArkUI'

interface Info {
  age: int;
  name: string;
}
@Entry
@Component
struct Index {
  @State info: Info = { age: 25, name: 'Tom' } as Info; // @State装饰的对象字面量

  build() {
    Column() {
      Button('show observed result')
        .backgroundColor('#FFFF00FF')
        .onClick(() => {
          console.info(`observed result: ${JSON.stringify(UIUtils.canBeObserved(this.info))}`); // 获取是否可观察信息
        })
      Text(`name: ${this.info.name}`).fontSize(20)
      Text(`age: ${this.info.age}`).fontSize(20)
      ParamChild({info: this.info})
    }
  }
}
@ComponentV2
struct ParamChild {
  @Param @Require info: Info;
  build() {
    Column() {
      Text(`V2 name: ${this.info.age}`)
      Text(`V2 name: ${this.info.name}`)
    }
  }
}
// [End CanBeObservedObjectLiteral]

@Builder
export function canBeObservedObjectLiteral(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.can_be_observed_object_literal_title'))
}