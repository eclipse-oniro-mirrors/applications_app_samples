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
// [Start ProvideConsumeBasic]
import { Button, ClickEvent, Column, Component, Consume, Entry, Provide, Row, Text } from '@kit.ArkUI';
@Component
struct ContentComponent {
  // @Consume装饰的变量通过相同的属性名绑定其祖先组件Index内的@Provide装饰的变量
  @Consume count: number;
  index: number;

  build() {
    Column() {
      Text(`Child ${this.index} count(${this.count})`)
        .fontSize(20)
        .margin(10)
      Button(`Child ${this.index} count(${this.count}), count + 1`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.count += 1;
        })
    }
    .width('100%')
  }
}

@Component
struct ListComponent {
  build() {
    // 通过index区分两个子组件
    ContentComponent({ index: 1})
    ContentComponent({ index: 2})
  }
}

@Entry
@Component
struct Index {
  // @Provide装饰的变量count由入口组件Index提供其后代组件
  @Provide count: number = 0;

  build() {
    Column() {
      Button(`Parent count(${this.count}), count + 1`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.count += 1;
        })
      ListComponent()
    }
    .width('100%')
  }
}
// [End ProvideConsumeBasic]

@Builder
export function provideConsumeBasic(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provide_consume_basic_title'))
}