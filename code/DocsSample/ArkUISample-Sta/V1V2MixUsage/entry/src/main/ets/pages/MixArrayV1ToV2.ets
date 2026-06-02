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

// [Start MixArrayV1ToV2]
import { Entry, Text, Column, Component, ComponentV2, Button, ClickEvent, State, Param } from '@kit.ArkUI';

@Entry
@Component
struct CompV1 {
  @State arr: Array<number> = [1.0, 2.0, 3.0];

  build() {
    Column() {
      Text(`V1 ${this.arr[0]}`)
      Button('Change object in V1')
        .onClick(() => {
          // 点击触发ArrayCompV1和ArrayCompV2变化
          this.arr[0]++;
        })
      ArrayCompV2({ arr: this.arr })
    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct ArrayCompV2 {
  @Param arr: Array<number> = [1.0, 2.0, 3.0];

  build() {
    Column() {
      Text(`V2 ${this.arr[0]}`)
      Button('Change object in V2')
        .onClick(() => {
          // 点击触发ArrayCompV1和ArrayCompV2变化
          this.arr[0]++;
        })
    }
  }
}
// [End MixArrayV1ToV2]

@Builder
export function mixArrayV1ToV2(): void {
  NavDestination() {
    CompV1()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.mix_array_v1_to_v2_title'))
}
