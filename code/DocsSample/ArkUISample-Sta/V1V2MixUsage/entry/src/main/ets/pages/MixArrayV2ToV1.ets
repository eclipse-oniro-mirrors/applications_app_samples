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

// [Start MixArrayV2ToV1]
import { Entry, Text, Column, Component, ComponentV2, Button, ClickEvent, Local, ObjectLink } from '@kit.ArkUI';

@Entry
@ComponentV2
struct CompV2 {
  @Local arr: Array<number> = [1, 2, 3];

  build() {
    Column() {
      Text(`V2 ${this.arr[0]}`).fontSize(20)
      Button('Change object in V2')
        .onClick(() => {
          // 点击触发V2变化，且同步给V1 @ObjectLink
          this.arr[0]++;
        })
      ArrayCompV1({ arr: this.arr })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct ArrayCompV1 {
  @ObjectLink arr: Array<number>;

  build() {
    Column() {
      Text(`V1 ${this.arr[0]}`).fontSize(20)
      Button('Change object in V1')
        .onClick(() => {
          // 点击触发V1变化，且双向同步回给V2
          this.arr[0]++;
        })
    }
  }
}
// [End MixArrayV2ToV1]

@Builder
export function mixArrayV2ToV1(): void {
  NavDestination() {
    CompV2()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.mix_array_v2_to_v1_title'))
}
