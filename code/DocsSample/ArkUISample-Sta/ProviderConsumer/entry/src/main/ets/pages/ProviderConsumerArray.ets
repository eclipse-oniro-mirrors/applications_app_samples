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
// [Start ProviderConsumerArray]
import { Button, ClickEvent, Column, ComponentV2, Consumer, Entry, ForEach, Provider, Text } from '@kit.ArkUI';

@ComponentV2
struct Child {
  @Consumer() arr: number[] = [6.0, 7.0, 8.0];

  build() {
    Column() {
      Button('child change arr item')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 修改arr变量中元素，触发UI刷新
          this.arr[0]++;
          this.arr[1] += 2;
        })
      Button('child reverse arr')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 翻转arr变量，触发UI刷新
          this.arr.reverse();
        })
    }
    .width('100%')
  }
}

@Entry
@ComponentV2
struct Parent {
  @Provider() arr: number[] = [1.0, 2.0, 3.0];

  build() {
    Column() {
      Button('parent change whole arr')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 赋值arr变量，触发UI刷新
          this.arr = [100, 200, 300];
        })
      Button('parent push new item')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 向arr变量中添加元素，触发UI刷新
          this.arr.push(111);
        })   
      Child()
      ForEach(this.arr,
        (item: number) => {
          Text(`${item}`)
            .fontSize(20)
            .margin(10)
        })
    }
    .width('100%')
  }
}
// [End ProviderConsumerArray]

@Builder
export function providerConsumerArray(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provider_consumer_array_title'))
}