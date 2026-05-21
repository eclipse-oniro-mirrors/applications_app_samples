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
        .onClick((e: ClickEvent) => {
          this.arr[0]++;
          this.arr[1] += 2;
        })
      Button('child reverse arr')
        .onClick((e: ClickEvent) => {
          this.arr.reverse();
        })
    }
  }
}

@Entry
@ComponentV2
struct Parent {
  @Provider() arr: number[] = [1.0, 2.0, 3.0];

  build() {
    Column() {
      Button('parent change whole arr')
        .onClick((e: ClickEvent) => {
          this.arr = [100, 200, 300];
        })
      Button('parent push new item')
        .onClick((e: ClickEvent) => {
          this.arr.push(111);
        })   
      Child()
      ForEach(this.arr,
        (item: number) => {
          Text(`${item}`)
        })
    }
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