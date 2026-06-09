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

// [Start MixCommonV1ToV2]
import { Entry, Text, Column, Component, ComponentV2, Button, ClickEvent, State, Param } from '@kit.ArkUI';

class CommonClass {
  name: string = 'Tom';
}

@Entry
@Component
struct CompV1 {
  @State commonObject: CommonClass = new CommonClass();

  build() {
    Column() {
      Text(`@State commonObject: ${this.commonObject.name}`)
        .fontSize(20)
        .margin(10)
      Button('Change object in V1')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.commonObject.name += '!'; // 非Observed/ObservedV2类，组件不刷新
        })
      CompV2({ commonObject: this.commonObject })
    }
    .width('100%')
  }
}

@ComponentV2
struct CompV2 {
  @Param commonObject: CommonClass = new CommonClass();

  build() {
    Column() {
      // 非Observed/ObservedV2类，观察不到变化
      Text(`@Param commonObject: ${this.commonObject.name}`)
        .fontSize(20)
        .margin(10)
      Button('Change object in V2')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.commonObject.name += '!'; // 非Observed/ObservedV2类，组件不刷新
        })
    }
    .width('100%')
  }
}
// [End MixCommonV1ToV2]

@Builder
export function mixCommonV1ToV2(): void {
  NavDestination() {
    CompV1()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.mix_common_v1_to_v2_title'))
}
