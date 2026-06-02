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
// [Start observed_built_in_types_faq2]
import { Button, Column, Component, Entry, Text, ObservedSet, Observed, ObservedV2, Track, Trace } from '@kit.ArkUI';

export class UserInfo extends ObservedSet<int> {
  userName: string = 'Jack';

  constructor() {
    super();
  }
}

@Observed
export class UserInfo1 extends ObservedSet<int> {
  @Track userName: string = 'Jack';

  constructor() {
    super();
  }
}

@ObservedV2
export class UserInfo2 extends ObservedSet<int> {
  @Trace userName: string = 'Jack';

  constructor() {
    super();
  }
}

@Entry
@Component
struct Index {
  arr1: UserInfo = new UserInfo();
  arr2: UserInfo1 = new UserInfo1();
  arr3: UserInfo2 = new UserInfo2();

  build() {
    Column() {
      Text(`${this.arr1.userName}`)
      Button('change arr1 userName')
        .onClick(() => {
          // 修改arr1的userName属性，UI不刷新。
          this.arr1.userName += 'Hi';
        })
      Text(`${this.arr2.userName}`)
      Button('change arr2 userName')
        .onClick(() => {
          // 修改arr2的userName属性，UI会刷新。
          this.arr2.userName += 'Hi';
        })
      Text(`${this.arr3.userName}`)
      Button('change arr3 userName')
        .onClick(() => {
          // 修改arr3的userName属性，UI会刷新。
          this.arr3.userName += 'Hi';
        })
    }
  }
}
// [End observed_built_in_types_faq2]

@Builder
export function observedBuiltInTypesFAQ2(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.observed_built_in_types_faq2_title'))
}