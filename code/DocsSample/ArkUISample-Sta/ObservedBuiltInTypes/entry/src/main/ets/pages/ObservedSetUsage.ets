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
// [Start observed_set_usage]
import { Button, Column, Component, Divider, Entry, ForEach, ObservedSet, Row, Text } from '@kit.ArkUI';

@Entry
@Component
struct SetSample {
  // 直接创建ObservedSet实例即具有API操作可观察能力，不依赖于状态管理装饰器。
  message: ObservedSet<int> = new ObservedSet<int>([0, 1, 2, 3]);

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.message.values()), (item: int) => {
          Text(`${item}`)
          Divider()
        })
        Button('add')
          .onClick(() => {
            // 添加元素，UI会刷新
            this.message.add(this.message.size);
          })
        Button('delete')
          .onClick(() => {
            // 移除值为0的元素，UI会刷新
            this.message.delete(0);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End observed_set_usage]

@Builder
export function observedSetUsage(): void {
  NavDestination() {
    SetSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.observed_set_usage_title'))
}