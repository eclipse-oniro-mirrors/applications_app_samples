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
// [Start ProviderConsumerMap]
import { Button, ClickEvent, Column, ComponentV2, Consumer, Divider, Entry, ForEach, Provider, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Parent {
  @Provider() message: Map<number, string> = new Map<number, string>([[0, 'a'], [1, 'b'], [2, 'c']]);

  build() {
    Column() {
      ForEach(Array.from(this.message.entries()), (item: [number, string]) => {
        Text(`${item[0]}`)
          .fontSize(20)
          .margin(10)
        Text(`${item[1]}`)
          .fontSize(20)
          .margin(10)
        Divider()
      })
      Button('parent init map')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 赋值message变量，触发UI刷新
          this.message = new Map<number, string>([[0, 'aa'], [1, 'bb'], [2, 'cc']]);
      })
      Button('parent set new one')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 新增键值对，触发UI刷新
          this.message.set(4, 'd');
      })
      Button('clear')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 清空Map，触发UI刷新
          this.message.clear();
      })
      Child()
    }
    .width('100%')
  }
}

@ComponentV2
struct Child {
  @Consumer() message: Map<number, string> = new Map<number, string>([[0, 'd'], [1, 'e'], [2, 'f']]);

  build() {
    Column() {
      Button('child init map')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 赋值message变量，触发UI刷新
          this.message = new Map<number, string>([[0, 'dd'], [1, 'ee'], [2, 'ff']]);
      })
      Button('child replace the first one')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 更新键值对，触发UI刷新
          this.message.set(0, 'a*');
      })
      Button('child delete the first one')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 删除键值对，触发UI刷新
          this.message.delete(0);
      })
    }
    .width('100%')
  }
}
// [End ProviderConsumerMap]

@Builder
export function providerConsumerMap(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provider_consumer_map_title'))
}