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
// [Start CanBeObservedBuiltIn]
import { Entry, Text, Column, Component, ComponentV2, Button, State, UIUtils, Param, Require } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  @State arr: int[] = [1, 2, 3]; // @State装饰Array类型

  build() {
    Column() {
      Button('show observed result')
        .backgroundColor('#FFFF00FF')
        .onClick(() => {
          console.info(`observed result: ${JSON.stringify(UIUtils.canBeObserved(this.arr))}`); // 获取是否可观察信息
        })
      Text(`${this.arr}`).fontSize(20)
      ParamChild({arr: this.arr})
    }
  }
}
@ComponentV2
struct ParamChild {
  @Param @Require arr: int[];
  build() {
    Column() {
      Text(`V2 arr: ${this.arr}`).fontSize(20)
    }
  }
}
// [End CanBeObservedBuiltIn]

@Builder
export function canBeObservedBuiltIn(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.can_be_observed_built_in_title'))
}