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
// [Start CanBeObservedAfterObserved]
import { Entry, Text, Column, Component, Button, State, UIUtils, Observed } from '@kit.ArkUI'
@Observed
class Info {
  age: number = 25;
  name: string = 'Tom';
}
@Entry
@Component
struct Index {
  @State info: Info = new Info(); // @Observed装饰的Info对象实例被@State装饰，可观察一层属性的变化

  build() {
    Column() {
      Text(`age: ${this.info.age}`)
        .onClick(() => {
          this.info.age++;
        })
      Button('show observe result')
        .onClick(() => {
          console.info(`observed result: ${JSON.stringify(UIUtils.canBeObserved(this.info))}`); // 获取是否可观察信息
        })
    }
  }
}
// [End CanBeObservedAfterObserved]

@Builder
export function canBeObservedAfterObserved(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.can_be_observed_after_observed_title'))
}