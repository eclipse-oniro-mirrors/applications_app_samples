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
// [Start ProviderConsumerFindNearest]
import { Column, ComponentV2, Consumer, Entry, Provider, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {
  @Provider() val: number = 10;

  build() {
    Column() {
      Parent()
    }
    .width('100%')
  }
}

@ComponentV2
struct Parent {
  @Provider() val: number = 20;
  @Consumer('val') val2: number = 0; // 10

  build() {
    Column() {
      Text(`val2 value is ${this.val2}`)
        .fontColor('#87CEEB')
        .fontSize(30)
        .margin(10)
      Child()
    }
    .width('100%')
  }
}

@ComponentV2
struct Child {
  @Consumer() val: number = 0; // 20

  build() {
    Column() {
      Text(`val value is ${this.val}`)
        .fontColor('#87CEEB')
        .fontSize(30)
        .margin(10)
    }
    .width('100%')
  }
}
// [End ProviderConsumerFindNearest]

@Builder
export function providerConsumerFindNearest(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provider_consumer_find_nearest_title'))
}