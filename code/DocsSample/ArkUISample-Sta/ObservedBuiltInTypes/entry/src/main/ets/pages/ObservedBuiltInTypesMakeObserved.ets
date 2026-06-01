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
// [Start observed_built_in_types_make_observed]
import { Button, Column, Component, Entry, Text, ObservedArray, UIUtils } from '@kit.ArkUI';

export interface Info {
  name: string;
}

@Entry
@Component
struct Index {
  arr: ObservedArray<Info> = new ObservedArray<Info>({ name: 'Hi' } as Info, { name: 'Hello' } as Info);
  arr2: Array<Info> = UIUtils.makeObserved([{ name: 'Hi' } as Info, { name: 'Hello' } as Info], false);
  arr3: Array<Info> = UIUtils.makeObserved([{ name: 'Hi' } as Info, { name: 'Hello' } as Info]);

  build() {
    Column() {
      Text(`${this.arr[0].name}`)
      Button('change arr[0] name')
        .onClick(() => {
          // 由于ObservedArray仅可观察API行为，故修改该属性，UI不会刷新。
          this.arr[0].name += 'Hi';
        })
      Text(`${this.arr2[0].name}`)
      Button('change arr2[0] name')
        .onClick(() => {
          // 由于allowDeep设置为false，故仅可观察API行为，修改该属性，UI不会刷新。
          this.arr2[0].name += 'Hi';
        })
      Text(`${this.arr3[0].name}`)
      Button('change arr3[0] name')
        .onClick(() => {
          // 由于此处未设置allowDeep，默认为深度观察，故修改该属性，UI会刷新。
          this.arr3[0].name += 'Hi';
        })
    }
  }
}
// [End observed_built_in_types_make_observed]

@Builder
export function observedBuiltInTypesMakeObserved(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.observed_built_in_types_make_observed_title'))
}