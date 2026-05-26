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
// [Start CanBeObservedObservedV2]
import { Entry, Text, Column, ComponentV2, Button, UIUtils, ObservedV2, Trace, Local } from '@kit.ArkUI'

@ObservedV2
class Info {
  @Trace age: int = 25;
  @Trace name: string = 'Tom'
}
@Entry
@ComponentV2
struct Index {
  @Local info: Info = new Info(); // @ObservedV2装饰的对象实例

  build() {
    Column() {
      Button('show observed result')
        .backgroundColor('#FFFF00FF')
        .onClick(() => {
          console.info(`observed result: ${JSON.stringify(UIUtils.canBeObserved(this.info))}`); // 获取是否可观察信息
        })
      Text(`name: ${this.info.name}`).fontSize(20)
      Text(`age: ${this.info.age}`).fontSize(20)
    }
  }
}
// [End CanBeObservedObservedV2]

@Builder
export function canBeObservedObservedV2(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.can_be_observed_observed_v2_title'))
}