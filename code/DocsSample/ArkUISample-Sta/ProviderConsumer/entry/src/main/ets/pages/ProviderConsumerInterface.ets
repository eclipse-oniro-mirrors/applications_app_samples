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
// [Start ProviderConsumerInterface]
import { Button, ClickEvent, Column, ComponentV2, Consumer, Entry, Provider, Text } from '@kit.ArkUI';

interface Info {
  name: string;
}

@Entry
@ComponentV2
struct Parent {
  // 装饰字面量
  @Provider() info: Info = { name: 'Bob' } as Info;

  build() {
    Column() {
      Text(`parent name: ${this.info.name}`)
        .fontSize(20)
        .margin(10)
      Button('parent change whole interface')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.info = { name: 'Tom' } as Info; // 变化可观察
        })
      Button('parent change interface name')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.info.name += '~'; // 变化无法观察
        })
      Child()
    }
    .width('100%')
  }
}

@ComponentV2
struct Child {
  // 装饰字面量
  @Consumer() info: Info = { name: 'Mary' } as Info;

  build() {
    Column() {
      Text(`child name: ${this.info.name}`)
        .fontSize(20)
        .margin(10)
      Button('child change whole interface')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.info = { name: 'Jerry' } as Info; // 变化可观察
        })
      Button('child change interface name')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.info.name += '*'; // 变化无法观察
        })
    }
    .width('100%')
  }
}
// [End ProviderConsumerInterface]

@Builder
export function providerConsumerInterface(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provider_consumer_interface_title'))
}