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
// [Start ProviderConsumerSet]
import { Button, ClickEvent, Column, ComponentV2, Consumer, Divider, Entry, ForEach, Provider, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Parent {
  @Provider() message: Set<number> = new Set<number>([1, 2, 3, 4]);

  build() {
    Column() {
      ForEach(Array.from(this.message.entries()), (item: [number, number]) => {
        Text(`${item[0]}`)
          .fontSize(20)
          .margin(10)
        Divider()
      })
      Button('parent init set')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.message = new Set<number>([1, 2, 3, 4]);
      })
      Button('parent set new one')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 新增元素，触发UI刷新
          this.message.add(5);
      })
      Child()
    }
    .width('100%')
  }
}

@ComponentV2
struct Child {
  @Consumer() message: Set<number> = new Set<number>([1, 2, 3, 4, 5, 6]);

  build() {
    Column() {
      Button('child init set')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.message = new Set<number>([1, 2, 3, 4, 5, 6]);
      })
      Button('child clear')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 清空Set，触发UI刷新
          this.message.clear();
      })
      Button('child delete the first one')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 删除元素，触发UI刷新
          this.message.delete(1);
      })
    }
    .width('100%')
  }
}
// [End ProviderConsumerSet]

@Builder
export function providerConsumerSet(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provider_consumer_set_title'))
}