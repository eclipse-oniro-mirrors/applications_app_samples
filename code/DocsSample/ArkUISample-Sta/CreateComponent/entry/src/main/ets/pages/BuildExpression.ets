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
// [Start BuildExpression]
import { ClickEvent, Column, Component, Entry, State, Text } from '@kit.ArkUI';

@Entry
@Component
struct MyComponent {
  @State stateVar: int = 1;
  build() {
    Column() {
      this.stateVar == 1 ? Text('is equal to 1'): Text('is not equal to 1'); // 支持使用表达式
      Text('hello world')
        .onClick((e: ClickEvent) => {
          this.stateVar++;
        })
    }
  }
}
// [End BuildExpression]

@Builder
export function buildExpression(): void {
  NavDestination() {
    MyComponent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.build_expression_title'))
}
