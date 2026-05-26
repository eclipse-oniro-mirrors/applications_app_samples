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
// [Start CanBeObservedNotRefresh]
import { Entry, Text, Column, Component, Button, State, UIUtils } from '@kit.ArkUI'
class Info {
  age: number = 25;
  name: string = 'Tom';
}
@Entry
@Component
struct Index {
  @State info: Info = new Info(); // Info对象实例直接被@State装饰，无法观察一层属性的变化

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
// [End CanBeObservedNotRefresh]

@Builder
export function canBeObservedNotRefresh(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.can_be_observed_not_refresh_title'))
}