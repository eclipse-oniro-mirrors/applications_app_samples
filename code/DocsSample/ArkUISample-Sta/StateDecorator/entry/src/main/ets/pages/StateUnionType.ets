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
// [Start StateUnionType]
import { Button, ClickEvent, Column, Component, Entry, State, Text, Row } from '@kit.ArkUI';

@Entry
@Component
struct UnionTypeSample {
  @State count: int | undefined = 0; // 使用@State装饰联合类型变量

  build() {
    Row() {
      Column() {
        Text(`count: ${this.count}`)
        // 将联合类型变量从int切换为undefined，触发UI刷新
        Button('change to undefined')
          .onClick(() => {
            this.count = undefined;
          })
          .width(300)
          .margin(10)
        // 将联合类型变量从undefined切换为int，触发UI刷新
        Button('change to int')
          .onClick(() => {
            this.count = 10;
          })
          .width(300)
          .margin(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End StateUnionType]

@Builder
export function stateUnionType(): void {
  NavDestination() {
    UnionTypeSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.state_union_type_title'))
}