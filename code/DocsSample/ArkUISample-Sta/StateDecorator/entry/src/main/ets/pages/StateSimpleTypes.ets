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
// [Start StateSimpleTypes]
import { Button, ClickEvent, Component, Entry, State, Row, Column } from '@kit.ArkUI';

@Entry
@Component
struct MyComponent {
  @State count: int = 0; // 使用@State装饰简单类型变量

  build() {
    Row() {
      Column() {
        Button(`click times: ${this.count}`)
          .onClick(() => {
            this.count += 1;
          })
          .width(300)
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End StateSimpleTypes]

@Builder
export function stateSimpleTypes(): void {
  NavDestination() {
    MyComponent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.state_simple_types_title'))
}