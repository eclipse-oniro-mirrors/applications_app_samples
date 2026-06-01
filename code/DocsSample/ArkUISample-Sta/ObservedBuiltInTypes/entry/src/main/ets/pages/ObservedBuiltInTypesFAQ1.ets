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
// [Start observed_built_in_types_faq1]
import { Button, Column, Component, Entry, Text, ObservedArray } from '@kit.ArkUI';

export interface Info {
  name: string;
}

@Entry
@Component
struct Index {
  arr: ObservedArray<Info> = new ObservedArray<Info>(3, (index: int): Info => {
    return { name: ('Hello World ' + index.toString()) } as Info
  });

  build() {
    Column() {
      Text(`${this.arr[0].name}`)
      Button('change arr[0] name')
        .onClick(() => {
          // 由于不会给元素添加代理，所以修改第一个元素的属性，UI不会刷新。
          this.arr[0].name += 'Hi';
        })
    }
  }
}
// [End observed_built_in_types_faq1]

@Builder
export function observedBuiltInTypesFAQ1(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.observed_built_in_types_faq1_title'))
}