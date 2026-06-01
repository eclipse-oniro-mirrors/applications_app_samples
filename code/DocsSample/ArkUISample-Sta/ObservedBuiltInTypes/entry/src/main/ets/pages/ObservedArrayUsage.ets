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
// [Start observed_array_usage]
import { Button, Column, Component, Entry, Text, ObservedArray } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  // 直接创建ObservedArray实例即具有API操作可观察能力，不依赖于状态管理装饰器。
  arr: ObservedArray<int> = new ObservedArray<int>(3, (index: int): int => index);

  build() {
    Column() {
      Text(`${this.arr}`)
      Button('push')
        .onClick(() => {
          // 添加元素，UI会刷新
          this.arr.push(this.arr.length);
        })
      Button('reverse')
        .onClick(() => {
          // 翻转arr中的元素，UI会刷新
          this.arr.reverse();
        })
    }
  }
}
// [End observed_array_usage]

@Builder
export function observedArrayUsage(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.observed_array_usage_title'))
}